import 'package:capstone/view/screen/main_screen.dart';
import 'package:capstone/view/screen/signup_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import '../../controller/login_controller.dart';
import 'package:provider/provider.dart';
import '../widget/input_widget.dart';
import 'forget_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final patternColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.green;

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
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.09,
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 30,
            right: 30,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.77,
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextWidget(
                        text: AppLocalizations.of(context)!.login,
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.width * (32 / 430),
                        fontFamily: 'Inter',
                        letterSpacing: -0.2,
                        fontColor: theme.textTheme.titleLarge?.color,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: AppLocalizations.of(context)!.have_account,
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width * (12 / 430),
                          fontFamily: 'Inter',
                          letterSpacing: -0.2,
                          fontColor: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: TextWidget(
                            text: AppLocalizations.of(context)!.sign_up,
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * (12 / 430),
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Consumer<LoginController>(
                      builder: (context, loginController, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                TextWidget(
                                  text: AppLocalizations.of(context)!.email,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                  fontFamily: 'Inter',
                                  letterSpacing: -0.2,
                                  fontColor: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
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
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                TextWidget(
                                  text: AppLocalizations.of(context)!.password,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.width * (12 / 430),
                                  fontFamily: 'Inter',
                                  letterSpacing: -0.2,
                                  fontColor: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
                                ),
                              ],
                            ),
                            InputWidget(
                              textEditingController: passwordTextEditingController,
                              obscureText: loginController.obscureTextPassword,
                              errorText: loginController.showErrorPassword
                                  ? AppLocalizations.of(context)!.enter_password
                                  : null,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController.changeObscureTextPassword();
                                },
                                icon: Icon(
                                  loginController.obscureTextPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                            ),
                            if (loginController.showErrorPassword)
                              const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * (32 / 430),
                          height: MediaQuery.of(context).size.height * (19 / 932),
                          child: Checkbox(
                            value: _isRememberMeChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isRememberMeChecked = value ?? false;
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return theme.primaryColor;
                                }
                                return theme.unselectedWidgetColor;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * (140 / 430),
                          height: MediaQuery.of(context).size.height * (18 / 932),
                          child: TextWidget(
                            text: AppLocalizations.of(context)!.remember_me,
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * (12 / 430),
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassword(),
                              ),
                            );
                          },
                          child: TextWidget(
                            text: AppLocalizations.of(context)!.forget_password,
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * (12 / 430),
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (295 / 430),
                      height: MediaQuery.of(context).size.height * (48 / 932),
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginController.showErrorEmail == true &&
                              loginController.showErrorPassword == true) {}
                          loginController.checkEmail(email: emailTextEditingController.text);
                          loginController.checkPassword(password: passwordTextEditingController.text);

                          if (!loginController.showErrorEmail && !loginController.showErrorPassword) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MainScreen()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: TextWidget(
                          text: AppLocalizations.of(context)!.login,
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * (12 / 430),
                          fontFamily: 'Inter',
                          letterSpacing: -0.2,
                          fontColor: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: theme.dividerColor,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidget(
                            text: AppLocalizations.of(context)!.or,
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * (12 / 430),
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: theme.dividerColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (295 / 430),
                      height: MediaQuery.of(context).size.height * (48 / 932),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
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
                            const SizedBox(width: 10),
                            TextWidget(
                              text: AppLocalizations.of(context)!.google,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width * (12 / 430),
                              fontFamily: 'Inter',
                              letterSpacing: -0.2,
                              fontColor: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (295 / 430),
                      height: MediaQuery.of(context).size.height * (48 / 932),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
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
                            const SizedBox(width: 10),
                            TextWidget(
                              text: AppLocalizations.of(context)!.facebook,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width * (12 / 430),
                              fontFamily: 'Inter',
                              letterSpacing: -0.2,
                              fontColor: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (295 / 430),
                      height: MediaQuery.of(context).size.height * (48 / 932),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
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
                            const SizedBox(width: 10),
                            TextWidget(
                              text: AppLocalizations.of(context)!.apple,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width * (12 / 430),
                              fontFamily: 'Inter',
                              letterSpacing: -0.2,
                              fontColor: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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