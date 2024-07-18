import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/cart/data/repos/carts_repo_impl.dart';
import 'package:ecommerceapp/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartRepoImplement cartRepoImplement = CartRepoImplement();
  fetchCarts() async {
    try {
      var result = await cartRepoImplement.fetchCarts();
      result.fold(
          (failure) => emit(FailedToGetCarts(errMessage: failure.errMessage)),
          (carts) {
            emit(GetCartsSuccess(carts: carts));
          } );
    } on DioError catch (e) {
      emit(FailedToGetCarts(
          errMessage: ServerFailure.fromDioError(e).toString()));
    }
  }
}
