import 'package:flutter/cupertino.dart';

class ResetPasswordController extends ChangeNotifier{
  bool passwordCorrect = true;
  bool passwordMatch = true;

  checkPassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = RegExp(pattern);
    passwordCorrect = regExp.hasMatch(password);
    notifyListeners();
  }

  passwordsMatch({required String password1, required String password2}) {
    if(password1 == password2){
      passwordMatch = true;

    }else{
      passwordMatch = false;

    }
    notifyListeners();
  }
}