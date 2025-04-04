import 'package:capstone/view/screen/profile2_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/text_widget.dart';

class Profile1Screen extends StatefulWidget {
  const Profile1Screen({super.key});

  @override
  State<Profile1Screen> createState() => _Profile1Screen();
}

class _Profile1Screen extends State<Profile1Screen> {
  bool pushNotifications = true;
  bool promotionalNotifications = false;


  @override
  Widget build(BuildContext context) {
     return Scaffold(

                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 22, right: 22,bottom: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * (26 / 932),
                          child: TextWidget(
                              text: "Profile",
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              letterSpacing: -0.2,
                              fontColor: Colors.black),
                        ),

                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * (400 / 430),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * (120 / 932),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/images/avatar.png',),
                        ),

                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * (380 / 430),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * (30 / 932),
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * (380 / 430),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * (30 / 932),
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
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text('Personal information'),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Profile2Screen(),));
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.language),
                                title: Text('Language'),
                                trailing: Text('عربية',
                                    style: TextStyle(color: Colors.grey)),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(Icons.privacy_tip),
                                title: Text('Privacy Policy'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text('Setting'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                                children: [
                                  SwitchListTile(
                                    title: Text('Push Notifications'),
                                    value: pushNotifications,
                                    activeColor: Colors.green,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                    onChanged: (value) {
                                      setState(() {
                                        pushNotifications = value;
                                      });
                                    },
                                  ),
                                  SwitchListTile(
                                    title: Text('Promotional Notifications'),
                                    value: promotionalNotifications,
                                    activeColor: Colors.green,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                    onChanged: (value) {
                                      setState(() {
                                        promotionalNotifications = value;
                                      });
                                    },
                                  )
                                ]
                            )),
                        SizedBox(height: 6),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'More',
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.info_outline),
                                title: Text('Help Center'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(Icons.logout, color: Colors.red),
                                title: Text(
                                  'Log Out',
                                  style: TextStyle(color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              );
        }
  }