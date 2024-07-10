import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/failure/failure.dart';
import '../../../data/services/auth_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
    final formKey = GlobalKey<FormState>();
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
TextEditingController nameController=TextEditingController();
TextEditingController phoneController=TextEditingController();
  AuthService authService = AuthService(dio: Dio());
  signUp(/*{
     required String name,
    required String phone,
    required String email,
    required String password, 
  }*/) async {
    try {
      emit(RegisterLoadingState());
      var data = await authService.auth(data: {
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }, endPoint: 'register');
      if (data['status'] == true) {
        emit(RegisterSuccessState());
      } else {
        emit(FailedToRegisterState(errMessage: data['message']));
      }
    } on Exception catch (e) {
      if (e is DioError) {
        return ServerFailure.fromDioError(e);
      }
    }
  }
}
