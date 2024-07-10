import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/home/data/repos/home_page_repo_implementation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../data/models/banners_model.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit() : super(BannersInitial());
  Box<BannersModel>? _bannersBox;
   HomeRepoImpl homeRepo=HomeRepoImpl();
  fetchBanners() async {
    try {
      emit(BannersLoadingState());
          // Check if banners data is available in Hive
      _bannersBox ??= await Hive.openBox<BannersModel>('banners');
      final bannersFromHive = _bannersBox?.values.toList();
      if (bannersFromHive != null && bannersFromHive.isNotEmpty) {
        emit(BannersSuccessState(banners: bannersFromHive));
        return;
      }
      var result = await homeRepo.fetchBanners();
      result.fold(
          (failure) =>
              emit(FailedToGetBannersState(errMessage: failure.errMessage)),
          (banners) async{
             // Save banners to Hive
          _bannersBox ??= await Hive.openBox<BannersModel>('banners');
          await _bannersBox?.clear();
          await _bannersBox?.addAll(banners);
             emit(BannersSuccessState(banners: banners));});
    } on DioError catch (e) {
      return ServerFailure.fromDioError(e);
    }
  }
}
