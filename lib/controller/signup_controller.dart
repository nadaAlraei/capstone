import 'package:flutter/cupertino.dart';

class SignUpController extends ChangeNotifier {
  bool emailNotCorrect = false;
  bool passwordNotCorrect = false;
  bool visiblePassword = true;
  bool fullNameIsEmpty = false;
  bool phoneNumberNotCorrect = false;
  bool birthDateIsEmpty =false;
  String countryCode = '';

  checkEmailCorrect({required String email}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    emailNotCorrect = !regExp.hasMatch(email);
    notifyListeners();
  }

  checkPassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    passwordNotCorrect = !regExp.hasMatch(password);
    notifyListeners();
  }

  checkFullName({required String fullName}) {
    fullNameIsEmpty = fullName.isEmpty;
    notifyListeners();
  }

  checkBirthDate({required String birthdate}) {
    birthDateIsEmpty = birthdate.isEmpty;
    notifyListeners();
  }

  checkPhoneNumber({required String phoneNumber}) {
    RegExp regex = RegExp(r'^\(\+\d{3}\) \d{3} \d{4}$');
    phoneNumberNotCorrect = !regex.hasMatch(phoneNumber);
    notifyListeners();
  }

  changeObscurePassword() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  changeCountryCode({required String code}){
    countryCode =code;
    notifyListeners();
  }


}
