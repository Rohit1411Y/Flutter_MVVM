import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static double averageRating(List<int>rating){
    var avgrating = 0;
    for(int i=0;i<rating.length;i++){
      avgrating = avgrating+rating[i];
    }
    return double.parse((avgrating/rating.length).toStringAsFixed(1));
  }


static void fieldFocusChange(BuildContext context,FocusNode currentFocus,FocusNode nextFocus){
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

  static toastMessage(String Message){
    Fluttertoast.showToast(msg: Message,backgroundColor: Colors.green,textColor: Colors.white,toastLength: Toast.LENGTH_LONG);
  }
  static void flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),

          message:message,
          messageSize: 20,
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          title: "Happy Happy",
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(Icons.error,size: 24,color: Colors.white),

          duration:Duration(seconds: 7),)..show(context),


    );
  }
  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          backgroundColor: Colors.yellow,
            content: Text(message))
    );
  }
}