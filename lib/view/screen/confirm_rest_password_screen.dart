import 'package:capstone/controller/reset_password_controller.dart';
import 'package:capstone/view/screen/forget_password.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/congrats_alert_widget.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ConfirmRestPasswordScreen extends StatelessWidget {
  ConfirmRestPasswordScreen({super.key});

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final backgroundColor = isDarkMode ? Colors.grey[900] : const Color.fromARGB(255, 37, 174, 75);
    final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryTextColor = isDarkMode ? Colors.grey[400] : const Color.fromARGB(255, 108, 114, 120);
    final accentColor = const Color.fromARGB(255, 37, 174, 75);
    final patternColor = isDarkMode ? Colors.grey[800] : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // background pattern
          Image.asset("assets/images/Pattern.png", color: patternColor),
          SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                  ),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ),
                SizedBox(height: 30),
                // Form Container
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07,
                  ),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Icon
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back, color: textColor),
                      ),
                      // Rest Password title & form
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Rest Password title
                            TextWidget(
                              text: AppLocalizations.of(context)!.rest_password,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontFamily: 'Inter',
                              letterSpacing: -0.02,
                              fontColor: textColor,
                            ),

                            // Back to Rest Password link
                            Row(
                              children: [
                                TextWidget(
                                  text: AppLocalizations.of(context)!.want_current_password,
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
                                    fontColor: accentColor,
                                  ),
                                ),
                              ],
                            ),

                            Consumer<ResetPasswordController>(
                              builder: (context, resetPasswordController, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // New Password
                                    // Field title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: AppLocalizations.of(context)!.new_password,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          letterSpacing: -0.02,
                                          fontColor: secondaryTextColor,
                                        ),
                                      ],
                                    ),

                                    // Field
                                    InputWidget(
                                      textEditingController: newPassword,
                                      obscureText: true,
                                      errorText: resetPasswordController.passwordCorrect
                                          ? null
                                          : AppLocalizations.of(context)!.enter_password,
                                    ),

                                    // Confirm New Password
                                    // Field title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: AppLocalizations.of(context)!.confirm_new_password,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          letterSpacing: -0.02,
                                          fontColor: secondaryTextColor,
                                        ),
                                      ],
                                    ),
                                    // Field
                                    InputWidget(
                                      textEditingController: confirmNewPassword,
                                      obscureText: true,
                                      errorText: resetPasswordController.passwordMatch
                                          ? null
                                          : AppLocalizations.of(context)!.passwords_does_not_match,
                                    ),

                                    SizedBox(height: 25),

                                    // Rest Password button
                                    TextButton(
                                      onPressed: () {
                                        resetPasswordController.checkPassword(
                                          password: newPassword.text,
                                        );
                                        resetPasswordController.passwordsMatch(
                                          password1: newPassword.text,
                                          password2: confirmNewPassword.text,
                                        );
                                        if (resetPasswordController.passwordCorrect == true) {
                                          if (resetPasswordController.passwordMatch == true) {
                                            showDialog(
                                              context: context,
                                              builder: (context) => CongratsAlertWidget(),
                                            );
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: accentColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text: AppLocalizations.of(context)!.update_password,
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
        ],
      ),
    );
  }
}