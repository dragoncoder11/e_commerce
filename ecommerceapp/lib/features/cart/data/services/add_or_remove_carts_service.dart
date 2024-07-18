import 'package:dio/dio.dart';

import '../../../../core/helper/constants.dart';

class AddOrRemoveCartsService{
  final Dio dio;

  AddOrRemoveCartsService({required this.dio});
  addOrRemoveCart({required String endPoint,required String productId})async{
  var response=await dio.get('$baseUrl$endPoint',options: Options(headers: {
  'lang':'en',
  'Content-Type':'application/json',
  'Authorization':token
}),data: {
  'product_id':productId
});
var responseData=response.data;
return responseData;
  }
}