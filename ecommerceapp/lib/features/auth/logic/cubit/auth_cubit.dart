import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/failure/failure.dart';
import 'package:ecommerceapp/features/auth/data/services/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthService authService = AuthService(dio: Dio());
  signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingState());
      var data = await authService.auth(data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
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

  login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      var data = await authService.auth(data: {
        'email': email,
        'password': password,
      }, endPoint: 'login');
      if (data['status'] == true) {
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
