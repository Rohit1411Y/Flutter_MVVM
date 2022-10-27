import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async  {
    dynamic responseJson;
   try{
  final http.Response response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
  responseJson = returnResponse(response);
  
   }
   on SocketDirection{
     throw FetchDataException('No Internet Connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try{
      http.Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));


      responseJson = returnResponse(response);

    }
    on SocketDirection{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException();
      case 500:
      default:
        throw FetchDataException('Error occured while communicating with server'+'with response code'+ response.statusCode.toString());
    }
  }
  
}