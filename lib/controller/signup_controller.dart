import 'package:flutter/cupertino.dart';

class SignUpController extends ChangeNotifier {
  bool fullNameIsEmpty = false;
  bool emailCorrect = false;
  bool birthDateIsEmpty = false;
  bool phoneNumberCorrect = false;
  bool passwordCorrect = false;
  bool obscureTextPassword = true;
  String countryCode = '';

  checkFullName({required String fullName}) {
    if (fullName.isNotEmpty) {
      fullNameIsEmpty = false;
    } else {
      fullNameIsEmpty = true;
    }
    notifyListeners();
  }

  checkEmailCorrect({required String email}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);

    if (regExp.hasMatch(email)) {
      emailCorrect = false;
    } else {
      emailCorrect = true;
    }
    notifyListeners();
  }

  checkBirthDate({required String birthDate}) {
    if (birthDate.isNotEmpty) {
      birthDateIsEmpty = false;
    } else {
      birthDateIsEmpty = true;
    }
    notifyListeners();
  }

  checkPhoneNumber({required String phoneNumber}) {
    RegExp regExp = RegExp(r'^\+\d{3} \d{3}-\d{4}$');
    if (regExp.hasMatch(phoneNumber)) {
      phoneNumberCorrect = false;
    } else {
      phoneNumberCorrect = true;
    }
    notifyListeners();
  }

  changeCountryCode({required String code}){
    countryCode = code;
    notifyListeners();
  }

  checkPassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    passwordCorrect = !regExp.hasMatch(password);
    notifyListeners();
  }

  changeObscurePassword() {
    obscureTextPassword = !obscureTextPassword;
    notifyListeners();
  }
}
