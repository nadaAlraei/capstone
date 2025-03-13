import 'package:capstone/view/screen/confirm_rest_password_screen.dart';
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
    loginController = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            color: Colors.white,
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
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),) );
                            },
                            child:
                            Row(
                              children: [
                                Icon(Icons.arrow_back),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * (50 / 430),
                                  height: MediaQuery.of(context).size.height * (24 / 932),
                                  child: TextWidget(
                                      text: AppLocalizations.of(context)!.back_to,
                                      fontWeight:  FontWeight.w600,
                                      fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                      fontFamily: 'Inter',
                                      letterSpacing: -0.2,
                                      fontColor: Colors.grey    ),
                                ),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width * (70 / 430),
                                  height: MediaQuery.of(context).size.height * (24 / 932),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                    },
                                    child:  TextWidget(
                                        text: AppLocalizations.of(context)!.login,
                                        fontWeight:  FontWeight.w600,
                                        fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                        fontFamily: 'Inter',
                                        letterSpacing: -0.2,
                                        fontColor: Colors.green    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * (50 / 430),
                                  height: MediaQuery.of(context).size.height * (24 / 932),
                                  child: TextWidget(
                                      text: AppLocalizations.of(context)!.page,
                                      fontWeight:  FontWeight.w600,
                                      fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                      fontFamily: 'Inter',
                                      letterSpacing: -0.2,
                                      fontColor: Colors.grey    ),
                                ),

                              ],
                            )

                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (200 / 430),
                      height: MediaQuery.of(context).size.height * (42 / 932),
                      child: TextWidget(
                          text: AppLocalizations.of(context)!.rest_password,
                          fontWeight:  FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * (32 / 430),
                          fontFamily: 'Inter',
                          letterSpacing: -0.2,
                          fontColor: Colors.black    ),
                    ),
                    SizedBox(height: 10,),
                    TextWidget(
                        text: AppLocalizations.of(context)!.enter_your_email,
                        fontWeight:  FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * (12 / 430),
                        fontFamily: 'Inter',
                        letterSpacing: -0.1,
                        fontColor: Colors.grey    ),
                    TextWidget(
                        text: AppLocalizations.of(context)!.send_you_link,
                        fontWeight:  FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * (12 / 430),
                        fontFamily: 'Inter',
                        letterSpacing: -0.1,
                        fontColor: Colors.grey    ),


                    TextWidget(
                        text: AppLocalizations.of(context)!.your_account,
                        fontWeight:  FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * (12 / 430),
                        fontFamily: 'Inter',
                        letterSpacing: -0.1,
                        fontColor: Colors.grey    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Align(
                        alignment: Alignment(0.78, 0.2),
                        child: TextWidget(
                            text: AppLocalizations.of(context)!.email,
                            fontWeight:  FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * (12 / 430),
                            fontFamily: 'Inter',
                            letterSpacing: -0.1,
                            fontColor: Colors.grey    ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24,bottom: 10),
                      child: Consumer<LoginController>(
                        builder: (context, loginController, child) {
                          return InputWidget(
                            textEditingController: emailTextEditingController,
                            obscureText: false,

                            errorText: loginController.showErrorEmail
                                ? AppLocalizations.of(context)!.enter_email
                                : null,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 24,left: 24,bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(context: context, builder: (context) => OTPAlertWidget(),);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:TextWidget(
                            text: AppLocalizations.of(context)!.send,
                          fontWeight:  FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width * (14 / 430),
                          fontFamily: 'Inter',
                          letterSpacing: -0.1,
                          fontColor: Colors.white    ),
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
