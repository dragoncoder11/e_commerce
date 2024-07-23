import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/cart/data/repos/carts_repo_impl.dart';
import 'package:ecommerceapp/features/cart/data/services/add_or_remove_carts_service.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  Set productsIdList={};
  List <ProductModel>cartsList=[];
  CartRepoImplement cartRepoImplement = CartRepoImplement();
  AddOrRemoveCartsService addOrRemoveCartsService =AddOrRemoveCartsService(dio: Dio());
  fetchCarts() async {
    try {
      var result = await cartRepoImplement.fetchCarts();
      result.fold(
          (failure) => emit(FailedToGetCarts(errMessage: failure.errMessage)),
          (carts) {
            cartsList=carts;
            emit(GetCartsSuccess(carts: carts));
            print('carts:${carts.length}');
          } );
    } on DioError catch (e) {
      emit(FailedToGetCarts(
          errMessage: ServerFailure.fromDioError(e).toString()));
    }
  }

  addOrRemoveCart({required String productId})async{
var data=await addOrRemoveCartsService.addOrRemoveCart(endPoint:'carts', productId: productId);
if (data['status']==true) {
  for (var i in data['data']['product']) {
    cartsList.add(i);
    productsIdList.add(i['id'].toString());
  }
  print('cartslength=${cartsList.length}');
  print('productid=${productsIdList.length}');
  if (productsIdList.contains(productId)) {
    productsIdList.remove(productId);
  }else{
        productsIdList.add(productId);

  }
 await fetchCarts();
  emit(AddOrRemoveCartsSuccess());
}
else{
  emit(FailedToAddOrRemoveCarts());
}
  }
}
