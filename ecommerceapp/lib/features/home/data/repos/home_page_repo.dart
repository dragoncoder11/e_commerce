import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/home/data/models/banners_model.dart';
import 'package:ecommerceapp/features/home/data/models/categories_model.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';

abstract class HomeRepo{
  Future <Either<ServerFailure,List<BannersModel>>>fetchBanners();
  Future <Either<ServerFailure,List<CategoriesModel>>>fetchCategories();
    Future <Either<ServerFailure,List<ProductModel>>>fetchProducts({required String categoryName});

}