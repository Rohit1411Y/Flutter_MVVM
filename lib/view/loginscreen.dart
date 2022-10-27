

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
     @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(

                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
               // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);

              },
            ),
            ValueListenableBuilder(valueListenable: _obsecurePassword,
                builder:(context,value,child){
              return TextFormField(
                controller: _passwordController,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: '*',
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  hintText: 'password',
                  labelText: 'password',

                  prefixIcon: Icon(Icons.lock_open_outlined),
                  suffixIcon: InkWell(
                    onTap:() {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                      child: Icon(
                        _obsecurePassword.value ? Icons.visibility_off_outlined:
                            Icons.visibility
                      )
                  ),


                ),

              );
                }),
            SizedBox(height: height*.1),
            RoundButton(title: 'Login',loading: authViewModel.loading,onPress: (){
              if(_emailController.text.isEmpty){
                Utils.flushBarErrorMessage('Please enter email', context);
              }
              else if(_passwordController.text.isEmpty){
                Utils.flushBarErrorMessage('Please enter password', context);
              }
              else if(_passwordController.text.length<6){
                Utils.flushBarErrorMessage('Password length must be greater than 6', context);

              }
              else{
                Map data = {
                  'email' : _emailController.text.toString(),
                  'password': _passwordController.text.toString()
                };
                authViewModel.loginApi(data, context);
                Utils.flushBarErrorMessage('Loading', context);

              }


            },),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap:(){
                Navigator.pushNamed(context,RoutesName.signUp);
              },
                child: Text("Don't have an account? Sign Up")
            )

          ],
        ),
      ),
    );
  }
}
