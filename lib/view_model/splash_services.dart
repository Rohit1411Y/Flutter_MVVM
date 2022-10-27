

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';

import '../models/user_model.dart';

class SplashServices{
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async{
     if(value.token.toString()=="null"||value.token.toString()==""){
       await Future.delayed(Duration(seconds: 3));
       Navigator.pushNamed(context,RoutesName.login);
     }
     else{
       await Future.delayed(Duration(seconds: 3));
       Navigator.pushNamed(context, RoutesName.home);
     }
    }).onError((error, stackTrace)
    {
      if(kDebugMode){
        error.toString();
      }
    });
  }
}