import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repos/home_page_repo_implementation.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  HomeRepoImpl homeRepoImpl = HomeRepoImpl();
  Box<ProductModel>? _productsBox;
  List<ProductModel> allProducts = [];

  fetchProducts({required String categoryName}) async {
    try {
      allProducts.clear();
      emit(ProductsLoadingState());
      // Check if banners data is available in Hive
      /*    _productsBox ??= await Hive.openBox<CategoriesModel>('categories');
      final categoriesFromHive = _productsBox?.values.toList();
      if (categoriesFromHive != null && categoriesFromHive.isNotEmpty) {
        emit(ProductsSuccessState(products: categoriesFromHive));
        return;
      } */
      var result = await homeRepoImpl.fetchProducts(categoryName: categoryName);
      /*  _productsBox ??= await Hive.openBox<ProductModel>('products');
      final productsFromHive = _productsBox?.values.toList();
      if (productsFromHive != null && productsFromHive.isNotEmpty) {
        emit(ProductsSuccessState(products: productsFromHive));
        return;
      } */
      result.fold(
          (failure) =>
              emit(FailedToGetProductsState(errMessage: failure.errMessage)),
          (products){
        this.allProducts = products;
      /*     _productsBox ??= await Hive.openBox<ProductModel>('products');
        await _productsBox?.clear();
        await _productsBox?.addAll(products);
        */
        emit(ProductsSuccessState(products: products));
      });
    } on DioError catch (e) {
      return ServerFailure.fromDioError(e);
    }
  }
}
