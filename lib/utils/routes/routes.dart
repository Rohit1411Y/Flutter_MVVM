import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/homescreen.dart';
import 'package:flutter_mvvm/view/loginscreen.dart';

import '../../view/signUpScreen.dart';
import '../../view/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> SignUpScreen());
        default:
          return MaterialPageRoute(builder: (_){
           return Scaffold(
             body: Center(
               child: Text("no route defined"),
             ),
           );
          });


    }
  }
}