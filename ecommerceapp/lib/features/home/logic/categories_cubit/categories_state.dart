part of 'categories_cubit.dart';
@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}
final class CategoriesSuccessState extends CategoriesState {
  final List<CategoriesModel>categories;

  CategoriesSuccessState({required this.categories});
}


final class FailedToGetCategoriesState extends CategoriesState {
  final String errMessage;

  FailedToGetCategoriesState({required this.errMessage});
}

