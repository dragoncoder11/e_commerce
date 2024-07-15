import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/home/data/models/products_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../core/failure/failure.dart';
import '../../data/models/categories_model.dart';
import '../../data/repos/home_page_repo_implementation.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  HomeRepoImpl homeRepoImpl = HomeRepoImpl();
 // Box<CategoriesModel>? _productsBox;
  List<ProductModel> allProducts = [];

  fetchProducts({required String categoryName}) async {
    try {
      emit(ProductsLoadingState());
      // Check if banners data is available in Hive
      /*    _productsBox ??= await Hive.openBox<CategoriesModel>('categories');
      final categoriesFromHive = _productsBox?.values.toList();
      if (categoriesFromHive != null && categoriesFromHive.isNotEmpty) {
        emit(ProductsSuccessState(products: categoriesFromHive));
        return;
      } */
      var result = await homeRepoImpl.fetchProducts(categoryName: categoryName);
      result.fold(
          (failure) =>
              emit(FailedToGetProductsState(errMessage: failure.errMessage)),
          (products) {
        this.allProducts = products;
        /*  // Save banners to Hive
        _productsBox ??= await Hive.openBox<CartModel>('products');
        await _productsBox?.clear();
        await _productsBox?.addAll(products); */
        emit(ProductsSuccessState(products: products));
      });
    } on DioError catch (e) {
      return ServerFailure.fromDioError(e);
    }
  }
}
