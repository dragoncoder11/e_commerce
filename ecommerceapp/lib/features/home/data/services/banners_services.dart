import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/helper/constants.dart';

class BannersService{
  final Dio dio;

  BannersService({required this.dio});

  getBanners({required String endPoint})async{
  var response=await dio.get('$baseUrl$endPoint');
  var body=response.data;
  return body;
  }
}