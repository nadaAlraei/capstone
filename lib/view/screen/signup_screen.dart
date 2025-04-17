import 'package:capstone/controller/signup_controller.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final List<String> codes = ['+962', '+966', '+974', '+971'];
  String? selectedCode = '+962';

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final primaryColor = isDarkMode ? Colors.green[700]! : Color.fromARGB(255, 37, 174, 75);
    final scaffoldBgColor = isDarkMode ? Colors.grey[900]! : Color.fromARGB(255, 37, 174, 75);
    final formBgColor = isDarkMode ? Colors.grey[850]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryTextColor = isDarkMode ? Colors.grey[400]! : Color.fromARGB(255, 108, 114, 120);
    final borderColor = isDarkMode ? Colors.grey[700]! : Color.fromARGB(255, 172, 172, 172);

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Pattern.png",
            color: isDarkMode ? Colors.grey[800] : Colors.white,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.09,
                    color: isDarkMode ? Colors.white : null,
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.99,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: formBgColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode ? Colors.black54 : Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_back, color: textColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: AppLocalizations.of(context)!.sign_up,
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                fontFamily: 'Inter',
                                letterSpacing: -0.02,
                                fontColor: textColor,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    text: AppLocalizations.of(context)!.have_account,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    letterSpacing: -0.01,
                                    fontColor: secondaryTextColor,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: TextWidget(
                                      text: AppLocalizations.of(context)!.login,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      letterSpacing: -0.01,
                                      fontColor: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Consumer<SignUpController>(
                                builder: (context, signUpController, child) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Full Name
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          TextWidget(
                                            text: AppLocalizations.of(context)!.full_name,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: '',
                                            letterSpacing: -0.02,
                                            fontColor: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      InputWidget(
                                        textEditingController: fullName,
                                        obscureText: false,
                                        errorText: signUpController.fullNameIsEmpty
                                            ? AppLocalizations.of(context)!.enter_full_name
                                            : null,
                                        hintText: 'Lois Becket',
                                      ),

                                      // Email
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          TextWidget(
                                            text: AppLocalizations.of(context)!.email,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: '',
                                            letterSpacing: -0.02,
                                            fontColor: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      InputWidget(
                                        textEditingController: email,
                                        obscureText: false,
                                        errorText: signUpController.emailNotCorrect
                                            ? AppLocalizations.of(context)!.enter_email
                                            : null,
                                        hintText: 'rayadaboor@gmail.com',
                                      ),

                                      // Birthdate
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          TextWidget(
                                            text: AppLocalizations.of(context)!.birthdate,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: '',
                                            letterSpacing: -0.02,
                                            fontColor: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: MediaQuery.of(context).size.height * 0.057,
                                        width: MediaQuery.of(context).size.width * 0.83,
                                        margin: EdgeInsets.only(left: 10, right: 10),
                                        child: DateFormatField(
                                          controller: birthdate,
                                          decoration: InputDecoration(
                                            errorText: signUpController.birthDateIsEmpty
                                                ? AppLocalizations.of(context)!.enter_birthdate
                                                : null,
                                            hintText: '18/03/2024',
                                            hintStyle: TextStyle(color: secondaryTextColor),
                                            filled: true,
                                            fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: isDarkMode ? Colors.grey[700]! : Color.fromARGB(255, 237, 241, 243),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          type: DateFormatType.type1,
                                          onComplete: (date) {
                                            // print(date.toString)
                                          },                                        ),
                                      ),

                                      // Phone Number
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          TextWidget(
                                            text: AppLocalizations.of(context)!.phone_number,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: '',
                                            letterSpacing: -0.02,
                                            fontColor: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: 80,
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.063,
                                              padding: EdgeInsets.only(left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: borderColor,
                                                  width: 1,
                                                ),
                                                color: isDarkMode ? Colors.grey[800] : null,
                                              ),
                                              child: DropdownButton<String>(
                                                menuWidth: 80,
                                                underline: Container(height: 0),
                                                isExpanded: true,
                                                padding: EdgeInsets.zero,
                                                value: selectedCode,
                                                dropdownColor: isDarkMode ? Colors.grey[800] : Colors.white,
                                                style: TextStyle(color: textColor),
                                                items: codes.map((String item) {
                                                  return DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(item),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  selectedCode = newValue;
                                                  signUpController.changeCountryCode(code: newValue!);
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            margin: EdgeInsets.only(top: 20),
                                            child: InputWidget(
                                              errorText: signUpController.phoneNumberNotCorrect
                                                  ? AppLocalizations.of(context)!.enter_phone
                                                  : null,
                                              keyboardType: TextInputType.phone,
                                              textEditingController: phoneNumber,
                                              obscureText: false,
                                              hintText: '${signUpController.countryCode} 726-0592',
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Password
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          TextWidget(
                                            text: AppLocalizations.of(context)!.set_password,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: '',
                                            letterSpacing: -0.02,
                                            fontColor: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      InputWidget(
                                        textEditingController: password,
                                        obscureText: signUpController.visiblePassword,
                                        errorText: signUpController.passwordNotCorrect
                                            ? AppLocalizations.of(context)!.enter_password
                                            : null,
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            signUpController.changeObscurePassword();
                                          },
                                          icon: Icon(
                                            signUpController.visiblePassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: secondaryTextColor,
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () {
                                          signUpController.checkFullName(fullName: fullName.text);
                                          signUpController.checkEmailCorrect(email: email.text);
                                          signUpController.checkBirthDate(birthdate: birthdate.text);
                                          signUpController.checkPhoneNumber(phoneNumber: phoneNumber.text);
                                          signUpController.checkPassword(password: password.text);

                                          if (signUpController.fullNameIsEmpty == true ||
                                              signUpController.passwordNotCorrect == true ||
                                              signUpController.emailNotCorrect == true ||
                                              signUpController.birthDateIsEmpty == true ||
                                              signUpController.phoneNumberNotCorrect == true) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Account Not Created'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          } else {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginScreen(),
                                              ),
                                            );
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Account Created'),
                                                backgroundColor: primaryColor,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.9,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: TextWidget(
                                              text: AppLocalizations.of(context)!.register,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              letterSpacing: -0.01,
                                              fontColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}