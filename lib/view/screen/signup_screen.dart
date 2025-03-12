import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:date_format_field/date_format_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of items in the dropdown
    final List<String> items = ['+963', '+962', '+962', '+962'];

    // Selected item
    String? selectedItem = '+963';
    TextEditingController fullName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController birthdate = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 174, 75),
      body: Stack(
        children: [
          // background pattern
          Image.asset("assets/images/Pattern.png", color: Colors.white),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(height: 30),
                  // Form Container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.77,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        // Sign up title & form
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Sign up title
                              TextWidget(
                                text: 'Sign up',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                fontFamily: 'Inter',
                                letterSpacing: -0.02,
                                fontColor: Colors.black,
                              ),

                              // Back to login link
                              Row(
                                children: [
                                  TextWidget(
                                    text: 'Already have an account?',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    letterSpacing: -0.01,
                                    fontColor: Color.fromARGB(
                                      255,
                                      108,
                                      114,
                                      120,
                                    ),
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
                                      text: 'Login',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      letterSpacing: -0.01,
                                      fontColor: Color.fromARGB(
                                        255,
                                        37,
                                        174,
                                        75,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Form
                              Form(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // FullName

                                    // Filed title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: 'FullName',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: '',
                                          letterSpacing: -0.02,
                                          fontColor: Color.fromARGB(
                                            255,
                                            108,
                                            114,
                                            120,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Field
                                    InputWidget(
                                      textEditingController: fullName,
                                      obscureText: false,
                                      //errorText: 'Enter full name please',
                                      hintText: 'Lois Becket',
                                    ),

                                    // Email

                                    // Filed title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: 'Email',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: '',
                                          letterSpacing: -0.02,
                                          fontColor: Color.fromARGB(
                                            255,
                                            108,
                                            114,
                                            120,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Field
                                    InputWidget(
                                      textEditingController: email,
                                      obscureText: false,
                                      //errorText: 'Enter full name please',
                                      hintText: 'rayadaboor@gmail.com',
                                    ),

                                    // Birth of date

                                    // Filed title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: 'Birth of date',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: '',
                                          letterSpacing: -0.02,
                                          fontColor: Color.fromARGB(
                                            255,
                                            108,
                                            114,
                                            120,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Date Field
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.057,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.83,
                                      margin: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: DateFormatField(
                                        decoration: InputDecoration(
                                          hintText: '18/03/2024',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                255,
                                                237,
                                                241,
                                                243,
                                              ),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        type: DateFormatType.type1,
                                        onComplete: (date) {
                                          // print(date.toString)
                                        },
                                      ),
                                    ),

                                    // Phone number
                                    SizedBox(height: 7),
                                    // Filed title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: 'Phone Number',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: '',
                                          letterSpacing: -0.02,
                                          fontColor: Color.fromARGB(
                                            255,
                                            108,
                                            114,
                                            120,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Field
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SizedBox(
                                          width: 80,
                                          child: Container(
                                            height:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.057,
                                            padding: EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                  255,
                                                  172,
                                                  172,
                                                  172,
                                                ),
                                                width: 1,
                                              ),
                                            ),
                                            child: DropdownButton<String>(
                                              menuWidth: 80,
                                              underline: Container(height: 0),
                                              isExpanded: true,
                                              padding: EdgeInsets.zero,
                                              hint: Text("Select a fruit"),
                                              value: selectedItem,
                                              // The currently selected item
                                              items:
                                                  items.map((String item) {
                                                    return DropdownMenuItem<
                                                      String
                                                    >(
                                                      value: item,
                                                      child: Text(item),
                                                    );
                                                  }).toList(),
                                              onChanged: (String? newValue) {
                                                selectedItem = newValue;
                                              },
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.62,
                                          child: InputWidget(
                                            textEditingController: phoneNumber,
                                            obscureText: false,
                                            //errorText: 'Enter full name please',
                                            hintText:
                                                '($selectedItem) 726-0592',
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Password

                                    // Filed title
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        TextWidget(
                                          text: 'Set Password',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: '',
                                          letterSpacing: -0.02,
                                          fontColor: Color.fromARGB(
                                            255,
                                            108,
                                            114,
                                            120,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Field
                                    InputWidget(
                                      textEditingController: fullName,
                                      obscureText: true,
                                      suffixIcon: Icon(Icons.visibility_off),
                                      //errorText: 'Enter full name please',
                                      //hintText: 'Lois Becket',
                                    ),

                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.9,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                            255,
                                            37,
                                            174,
                                            75,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text: 'Register',
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
            ),
          ),
        ],
      ),
    );
  }
}
