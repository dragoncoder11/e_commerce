import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/helper/constants.dart';

class CartsService{
  final Dio dio;

  CartsService({required this.dio});

  getCarts({required String endPoint})async{
var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
  'lang':'en',
  'Content-Type':'application/json',
  'Authorization':token
}));
var responseData=response.data;
return responseData;
  }
}