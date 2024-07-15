import 'package:dio/dio.dart';

import '../../../../core/helper/constants.dart';

class ProductsService {
  final Dio dio;

  ProductsService({required this.dio});

  getProducts({required String endPoint, required String categoryName}) async {
    var response = await dio.post('$baseUrl$endPoint',
        data: {
          'text': categoryName,
        },
        options: Options(headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token
        }));
    var body = response.data;
    return body;
  }
}
