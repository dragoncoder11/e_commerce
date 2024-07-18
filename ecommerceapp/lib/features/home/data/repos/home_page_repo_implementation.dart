import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/home/data/models/banners_model.dart';
import 'package:ecommerceapp/features/home/data/models/categories_model.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';
import 'package:ecommerceapp/features/home/data/repos/home_page_repo.dart';
import 'package:ecommerceapp/features/home/data/services/banners_services.dart';
import 'package:ecommerceapp/features/home/data/services/categories_service.dart';
import 'package:ecommerceapp/features/home/data/services/products_service.dart';

class HomeRepoImpl extends HomeRepo{
  BannersService bannersService=BannersService(dio: Dio());
  CategoriesService categoriesService=CategoriesService(dio: Dio());
  ProductsService productsService=ProductsService(dio: Dio());
  @override
  List<BannersModel> banners=[];
  Future<Either<ServerFailure, List<BannersModel>>> fetchBanners()async {
    try {
  var data =await bannersService.getBanners(endPoint: 'banners');
  
  for(var i in data['data']){
     banners.add(BannersModel.fromJson(i));
  }
  return right(banners);
} on DioError catch (e) {
  return left(ServerFailure.fromDioError(e));
}
    
  }

  @override
  List<CategoriesModel>categories=[];
  Future<Either<ServerFailure, List<CategoriesModel>>> fetchCategories() async{
    try {
  var data =await categoriesService.getCategories(endPoint:'categories');
  for (var i in data['data']['data']) {
    categories.add(CategoriesModel.fromJson(i));
  }
  return right(categories);
} on DioError catch (e) {
  return left(ServerFailure.fromDioError(e));
}
  }

  @override
    List<ProductModel>products=[];

  Future<Either<ServerFailure, List<ProductModel>>> fetchProducts({required String categoryName})async {
 try {
  var data =await productsService.getProducts(endPoint:'products/search?',categoryName:categoryName );
  for (var i in data['data']['data']) {
    products.add(ProductModel.fromJson(i));
  }
  return right(products);
} on DioError catch (e) {
  return left(ServerFailure.fromDioError(e));
}
}
}