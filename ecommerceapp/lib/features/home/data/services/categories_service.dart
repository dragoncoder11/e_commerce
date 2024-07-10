import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/helper/constants.dart';

class CategoriesService{
  final Dio dio;

  CategoriesService({required this.dio});

  getCategories({required String endPoint})async{
    var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
      'lang':'en',
    }));
    var body=response.data;
    return body;
  }
}