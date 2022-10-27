import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/user_model.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data , BuildContext context) async{
    setLoading(true);
    _myrepo.loginApi(data).then((value){
      final userPreference = Provider.of<UserViewModel>(context,listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString()
      ));
      setLoading(false);
      Utils.flushBarErrorMessage(value.toString(), context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){

        print(value.toString());


      }

    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);


      if(kDebugMode){

        print(error.toString());
      }

    });


  }
  Future<void> registerApi(dynamic data , BuildContext context) async{
    setSignUpLoading(true);
    _myrepo.registerApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(value.toString(), context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){

        print(value.toString());


      }

    }).onError((error, stackTrace){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);


      if(kDebugMode){

        print(error.toString());
      }

    });


  }
}