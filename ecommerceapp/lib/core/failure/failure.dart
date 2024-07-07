import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;

  Failure({required this.errMessage});
}
class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioError(DioError dioError){
    switch (dioError.type){
      case DioErrorType.connectionTimeout:
      return ServerFailure(errMessage: 'connection timeout with ApiServer');
       case DioErrorType.sendTimeout:
      return ServerFailure(errMessage: 'send timeout with ApiServer');
       case DioErrorType.receiveTimeout:
      return ServerFailure(errMessage: 'receive timeout with ApiServer');
       case DioErrorType.badResponse:
      return ServerFailure.fromResponse(
        dioError.response!.statusCode,dioError.response!.data,
      );
       case DioErrorType.cancel:
      return ServerFailure(errMessage:'Request to ApiServer was canceled');
      case DioErrorType.unknown:
      if(dioError.message!.contains('socketException')){
        return ServerFailure(errMessage:'No internet connection');
      }
       return ServerFailure(errMessage:'No internet connection');
       default:
       return ServerFailure(errMessage: 'Opps there was an error , please try again later');
    }
    
     
  }
  factory ServerFailure.fromResponse(int?statusCode,dynamic response){
    if(statusCode==400||statusCode==401||statusCode==403){
    return ServerFailure(errMessage: response['error']['message']);
    }else if(statusCode==404){
      return ServerFailure(errMessage: 'Your request not found , please try again later!');
    }else if(statusCode==500){
      return ServerFailure(errMessage: 'Internal server error , please try again later!');
    }else{
      return ServerFailure(errMessage: 'Opps there was an error , please try again later');
    }
  }
}