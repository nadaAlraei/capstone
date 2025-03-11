import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool obscureTextPassword = true;

  checkEmail({required String email}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    showErrorEmail = !regExp.hasMatch(email);
    notifyListeners();
  }

  checkPassword({required String password}) {
    showErrorPassword = password.isEmpty;
    notifyListeners();
  }

  changeObscureTextPassword() {
    obscureTextPassword = !obscureTextPassword;
    notifyListeners();
  }
}