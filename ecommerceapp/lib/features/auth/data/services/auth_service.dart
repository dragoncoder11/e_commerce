import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/helper/constants.dart';
import 'package:flutter/material.dart';

class AuthService {
  final Dio dio;

  AuthService({required this.dio});

  auth({required Map<String, dynamic> data,required String endPoint}) async {
    try {
      var response = await dio.post('$baseUrl$endPoint',
          options: Options(
            headers: {'lang': 'en', 'Content-Type': 'application/json'},
          ),
          data: data);
      var body = response.data;
      return body;
    } on Exception catch (e) {
      return Text(e.toString());
    }
  }
}
