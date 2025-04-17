import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/otp_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/login_controller.dart';
import '../widget/input_widget.dart';
import '../widget/text_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailTextEditingController = TextEditingController();
  late LoginController loginController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.green;
    final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;
    final accentColor = Colors.green;
    final patternColor = isDarkMode ? Colors.grey[800] : Colors.white;

    loginController = Provider.of<LoginController>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            color: patternColor,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(
                'assets/images/logo.png',
                width: 307,
                height: 85,
              ),
            ),
          ),
          Positioned(
            top: 311,
            left: 43,
            right: 43,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back, color: secondaryTextColor),
                              SizedBox(width: 5),
                              TextWidget(
                                text: AppLocalizations.of(context)!.back_to,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                fontFamily: 'Inter',
                                letterSpacing: -0.2,
                                fontColor: secondaryTextColor,
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                },
                                child: TextWidget(
                                  text: AppLocalizations.of(context)!.login,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                  fontFamily: 'Inter',
                                  letterSpacing: -0.2,
                                  fontColor: accentColor,
                                ),
                              ),
                              SizedBox(width: 5),
                              TextWidget(
                                text: AppLocalizations.of(context)!.page,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                fontFamily: 'Inter',
                                letterSpacing: -0.2,
                                fontColor: secondaryTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TextWidget(
                      text: AppLocalizations.of(context)!.rest_password,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * (32 / 430),
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: textColor,
                    ),
                    SizedBox(height: 10),
                    TextWidget(
                      text: AppLocalizations.of(context)!.enter_your_email,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * (12 / 430),
                      fontFamily: 'Inter',
                      letterSpacing: -0.1,
                      fontColor: secondaryTextColor,
                    ),
                    TextWidget(
                      text: AppLocalizations.of(context)!.send_you_link,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * (12 / 430),
                      fontFamily: 'Inter',
                      letterSpacing: -0.1,
                      fontColor: secondaryTextColor,
                    ),
                    TextWidget(
                      text: AppLocalizations.of(context)!.your_account,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * (12 / 430),
                      fontFamily: 'Inter',
                      letterSpacing: -0.1,
                      fontColor: secondaryTextColor,
                    ),

                    Consumer<LoginController>(builder: (context, loginController, child) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              TextWidget(
                                text: AppLocalizations.of(context)!.email,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                fontFamily: 'Inter',
                                letterSpacing: -0.1,
                                fontColor: secondaryTextColor,
                              ),
                            ],
                          ),
                          InputWidget(
                            textEditingController: emailTextEditingController,
                            obscureText: false,
                            errorText: loginController.showErrorEmail
                                ? AppLocalizations.of(context)!.enter_email
                                : null,
                          ),
                        ],
                      );
                    }),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 24, left: 24, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if(emailTextEditingController.text.isNotEmpty) {
                              showDialog(
                                context: context,
                                builder: (context) => OTPAlertWidget(),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Email field is empty'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: TextWidget(
                            text: AppLocalizations.of(context)!.send,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * (14 / 430),
                            fontFamily: 'Inter',
                            letterSpacing: -0.1,
                            fontColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}