import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/helper/constants.dart';
import 'package:ecommerceapp/core/networking/cache.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../../core/failure/failure.dart';
import '../../../data/services/auth_service.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  late final formKey = GlobalKey<FormState>();
late final emailController=TextEditingController();
late final passwordController=TextEditingController();
  AuthService authService = AuthService(dio: Dio());
  login(/* {
    required String email,
    required String password,
  } */) async {
    try {
      emit(LoginLoadingState());
      var data = await authService.auth(data: {
        'email': emailController.text,
        'password': passwordController.text,
      }, endPoint: 'login');
      if (data['status'] == true) {
       await CacheNetwork.insertToCache(key: 'token', value: data['data']['token']);
       token=await CacheNetwork.getCacheData(key: 'token');
        emit(LoginSuccessState());
      } else {
        emit(FailedToLoginState(errMessage: data['message']));
      }
    } on Exception catch (e) {
      if (e is DioError) {
        return ServerFailure.fromDioError(e);
      }
    }
  }
}