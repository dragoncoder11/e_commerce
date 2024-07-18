import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';

abstract class CartsRepo{
 Future<Either<ServerFailure,List<ProductModel>>>fetchCarts();
}