part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
//final class GetCartsLoading extends CartState {}
final class GetCartsSuccess extends CartState {
  final List<ProductModel>carts;

  GetCartsSuccess({required this.carts});
}
final class FailedToGetCarts extends CartState {
  final String errMessage;

  FailedToGetCarts({required this.errMessage});
}
final class AddOrRemoveCartsSuccess extends CartState {}
final class FailedToAddOrRemoveCarts extends CartState {}


