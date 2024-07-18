
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/cart/data/repos/carts_repo.dart';
import 'package:ecommerceapp/features/cart/data/services/get_carts_service.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';

class CartRepoImplement implements CartsRepo{
  CartsService cartsService=CartsService(dio: Dio());
  List<ProductModel>carts=[];
  @override
  Future<Either<ServerFailure, List<ProductModel>>> fetchCarts() async{
    try {
      carts.clear();
  var data =await cartsService.getCarts(endPoint: 'carts');
  if (data['status']==true) {
    for (var i in data['data']['cart_items']) {
      carts.add(ProductModel.fromJson(i));
    }
    return right(carts);
  }else{
        return left(Error as ServerFailure);

  }
} on DioError catch (e) {
    return left(ServerFailure.fromDioError(e));
}
  }
}