import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/screen/order_checkout_screen.dart';
import 'package:capstone/view/screen/profile1_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../widget/text_widget.dart';

class Profile2Screen extends StatefulWidget {
  const Profile2Screen({super.key});

  @override
  State<Profile2Screen> createState() => _Profile2Screen();
}

class _Profile2Screen extends State<Profile2Screen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   AppBar(
          title: TextWidget(
            text: AppLocalizations.of(context)!.profile,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'Inter',
            letterSpacing: -0.2,
            fontColor: Colors.black,
          ),
          leading: IconButton(onPressed: () {
            bottomNavigationBarController.changeWidget(
              widget: Profile1Screen(),
            );
            bottomNavigationBarController.changeIndex(index: -5);
          }, icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.white,
        ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                width: MediaQuery.of(context).size.width * (400 / 430),
                height: MediaQuery.of(context).size.height * (120 / 932),
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/avatar.png'),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * (380 / 430),
                height: MediaQuery.of(context).size.height * (30 / 932),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidget(
                    text: "Ahmad Daboor",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
                    fontColor: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (380 / 430),
                height: MediaQuery.of(context).size.height * (30 / 932),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidget(
                    text: "ahmad1709@gmail.com",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
                    fontColor: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: AppLocalizations.of(context)!.user_name,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: usernameController,
                          obscureText: false,
                        ),
                      ),
                      TextWidget(
                        text: AppLocalizations.of(context)!.email,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: emailController,
                          obscureText: false,
                        ),
                      ),
                      TextWidget(
                        text: AppLocalizations.of(context)!.phone_number,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: phoneController,
                          obscureText: false,
                        ),
                      ),
                      TextWidget(
                        text: AppLocalizations.of(context)!.password,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: passwordController,
                          obscureText: true,
                        ),
                      ),
                      TextWidget(
                        text: AppLocalizations.of(context)!.address,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: addressController,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width * (295 / 430),
                  height: MediaQuery.of(context).size.height * (48 / 932),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.of(context)!.update,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
