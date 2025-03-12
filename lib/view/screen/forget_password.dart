import 'package:capstone/view/screen/confirm_rest_password_screen.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/login_controller.dart';
import '../widget/input_widget.dart';

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
                              Navigator.pop(context);
                            },
                            child:
                            Row(
                              children: [
                                Icon(Icons.arrow_back),
                                SizedBox(width: 5,),
                                const Text(
                                  "Back to ",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                  },
                                  child: const Text(
                                    " Login",
                                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Text(
                                  " Page?",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),

                              ],
                            )

                        ),
                      ],
                    ),
                    const Text(
                      "Reset Password",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    const Text(
                      "Enter your E-mail or phone and we'll",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "send you a link to get back into",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      " your account  ",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          " Email ",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
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
                                ? "Enter Valid Email"
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ConfirmRestPasswordScreen(),),);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Send", style: TextStyle(fontSize: 18, color: Colors.white)),
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
