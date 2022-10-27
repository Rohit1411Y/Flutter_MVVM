import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm/data/network/NetworkApiServices.dart';

import '../res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }

}