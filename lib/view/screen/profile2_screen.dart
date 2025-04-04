import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/screen/order_checkout_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  TextEditingController adressController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * (26 / 932),
                child: TextWidget(
                    text: "Profile",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
                    fontColor: Colors.black),
              ),

              Container(
                width: MediaQuery.of(context).size.width* (400/ 430),
                height: MediaQuery.of(context).size.height* (120/ 932),
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/avatar.png',),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * ( 380 / 430),
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
                width: MediaQuery.of(context).size.width * ( 380 / 430),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 60 / 430),
                        height: MediaQuery.of(context).size.height * (19 / 932),
                        child: TextWidget(
                          text: "Username",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: usernameController,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 30 / 430),
                        height: MediaQuery.of(context).size.height * (19 / 932),
                        child: TextWidget(
                          text: "Email",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: emailController,
                          obscureText: false,
                        ),
                      ),
                      TextWidget(
                        text: "Phone Number",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: phoneController,
                          obscureText: false,
                        ),
                      ),
                      TextWidget(
                        text: "Password",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: passwordController,
                          obscureText: true,
                        ),
                      ),
                      TextWidget(
                        text: "Address",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.black,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 365 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: InputWidget(
                          textEditingController: adressController,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            width: MediaQuery.of(context).size.width* (295/ 430),
            height: MediaQuery.of(context).size.height* (48/ 932),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 4),
                  ),
                ]
            ),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child:
                        Row(children: [
                          SizedBox(width: 125,),
                          Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),],)



                ),

              ],
            ),
          ),
        )

            ],
          ),
        ),
      ),
    );
  }
}