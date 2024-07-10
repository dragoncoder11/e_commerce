import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/home/data/repos/home_page_repo_implementation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../core/failure/failure.dart';
import '../../data/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  HomeRepoImpl homeRepoImpl = HomeRepoImpl();
  Box<CategoriesModel>? _categoriesBox;

  fetchCategories() async {
    try {
      emit(CategoriesLoadingState());
      // Check if banners data is available in Hive
      _categoriesBox ??= await Hive.openBox<CategoriesModel>('categories');
      final categoriesFromHive = _categoriesBox?.values.toList();
      if (categoriesFromHive != null && categoriesFromHive.isNotEmpty) {
        emit(CategoriesSuccessState(categories: categoriesFromHive));
        return;
      }
      var result = await homeRepoImpl.fetchCategories();
      result.fold(
          (failure) =>
              emit(FailedToGetCategoriesState(errMessage: failure.errMessage)),
          (categories) async {
        // Save banners to Hive
        _categoriesBox ??= await Hive.openBox<CategoriesModel>('categories');
        await _categoriesBox?.clear();
        await _categoriesBox?.addAll(categories);
        emit(CategoriesSuccessState(categories: categories));
      });
    } on DioError catch (e) {
      return ServerFailure.fromDioError(e);
    }
  }
}
