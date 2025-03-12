import 'package:capstone/view/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../controller/login_controller.dart';
import 'package:provider/provider.dart';
import '../widget/input_widget.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isRememberMeChecked = false;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
            top: 200,
            left: 30,
            right: 30,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            " Sign Up",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Email",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Consumer<LoginController>(
                      builder: (context, loginController, child) {
                        return InputWidget(
                          textEditingController: emailTextEditingController,
                          obscureText: false,
                          errorText:
                              loginController.showErrorEmail
                                  ? "Enter Valid Email"
                                  : null,
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Password",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Consumer<LoginController>(
                      builder: (context, loginController, child) {
                        return InputWidget(
                          textEditingController: passwordTextEditingController,
                          obscureText: loginController.obscureTextPassword,
                          errorText:
                              loginController.showErrorPassword
                                  ? "Enter Your Password"
                                  : null,
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginController.changeObscureTextPassword();
                            },
                            icon: Icon(
                              loginController.obscureTextPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: Checkbox(
                            value: _isRememberMeChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isRememberMeChecked = value ?? false;
                              });
                            },
                          ),
                        ),
                        const Text("Remember Me"),
                        const SizedBox(width: 60),
                        SizedBox(
                          width: 137,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //   loginController.checkEmail(
                          //   email: emailTextEditingController.text,
                          // );
                          // loginController.checkPassword(
                          //   password: passwordTextEditingController.text,
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(255, 237, 241, 243),
                            thickness: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or', // The text in between
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(255, 237, 241, 243),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              fit: BoxFit.cover,
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              "Continue with Google",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/facebook.png',
                              fit: BoxFit.cover,
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              "Continue with Facebook",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Apple.png',
                              fit: BoxFit.cover,
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              "Continue with Apple",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
