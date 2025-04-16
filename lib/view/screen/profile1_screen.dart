import 'package:capstone/controller/change_lang_controller.dart';
import 'package:capstone/view/screen/home_screen.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/screen/profile2_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    BottomNavigationBarController bottomNavigationBarController =
        Provider.of<BottomNavigationBarController>(context, listen: false);
    ChangeLangController changeLangController =
        Provider.of<ChangeLangController>(context, listen: false);
    String lang = 'عربية';
    if(changeLangController.locale ==Locale('en')){
      lang ='عربية';
    }else{
      lang ='English';
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            widget: HomeScreen(),
          );
          bottomNavigationBarController.changeIndex(index: 0);
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22, bottom: 35),
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
                margin: EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(AppLocalizations.of(context)!.person_info),
                      onTap: () {
                        bottomNavigationBarController.changeWidget(
                          widget: Profile2Screen(),
                        );
                        bottomNavigationBarController.changeIndex(index: -5);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text(AppLocalizations.of(context)!.language),
                      trailing: Text(
                        lang,
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        if (changeLangController.locale == Locale('en')) {
                          changeLangController.setLocale('ar');
                        } else {
                          changeLangController.setLocale('en');
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip),
                      title: Text(AppLocalizations.of(context)!.privacy_policy),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(AppLocalizations.of(context)!.setting),
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
                      title: Text(AppLocalizations.of(context)!.push_notifications),
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
                      title: Text(AppLocalizations.of(context)!.promotional_notifications),
                      value: promotionalNotifications,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          promotionalNotifications = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
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
                        AppLocalizations.of(context)!.more,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text(AppLocalizations.of(context)!.help_center),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        AppLocalizations.of(context)!.logout,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
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
