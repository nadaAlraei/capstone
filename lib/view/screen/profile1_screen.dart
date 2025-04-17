import 'package:capstone/controller/change_lang_controller.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/screen/profile2_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile1Screen extends StatefulWidget {
  const Profile1Screen({super.key});

  @override
  State<Profile1Screen> createState() => _Profile1ScreenState();
}

class _Profile1ScreenState extends State<Profile1Screen> {
  bool pushNotifications = true;
  bool promotionalNotifications = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    BottomNavigationBarController bottomNavigationBarController = Provider.of<BottomNavigationBarController>(context, listen: false);
    final langController = Provider.of<ChangeLangController>(context, listen: false);
    ChangeLangController changeLangController =
    Provider.of<ChangeLangController>(context, listen: false);
    String lang = 'عربية';
    if(changeLangController.locale ==Locale('en')){
      lang ='عربية';
    }else{
      lang ='English';
    }
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? Colors.grey[850] : theme.cardColor;
    final inactiveThumbColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final inactiveTrackColor = isDarkMode ? Colors.grey[700] : Colors.grey[300];
    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * (380 / 430),
                height: MediaQuery.of(context).size.height * (26 / 932),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.profile,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: textColor,
                ),
              ),

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
                    fontColor: textColor,
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
                    fontColor: textColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: cardColor,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: iconColor),
                      title: Text(AppLocalizations.of(context)!.person_info, style: TextStyle(color: textColor)),
                      onTap: () {
                        bottomNavigationBarController.changeWidget(widget: const Profile2Screen());
                        bottomNavigationBarController.changeIndex(index: -1);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language, color: iconColor),
                      title: Text(AppLocalizations.of(context)!.language, style: TextStyle(color: textColor)),
                      trailing: Text(lang, style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        final newLocale = langController.locale == const Locale('en') ? 'ar' : 'en';
                        langController.setLocale(newLocale);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip, color: iconColor),
                      title: Text(AppLocalizations.of(context)!.privacy_policy, style: TextStyle(color: textColor)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: iconColor),
                      title: Text(AppLocalizations.of(context)!.setting, style: TextStyle(color: textColor)),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: cardColor,
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text(AppLocalizations.of(context)!.push_notifications, style: TextStyle(color: textColor)),
                      value: pushNotifications,
                      activeColor: Colors.green,
                      inactiveThumbColor: inactiveThumbColor,
                      inactiveTrackColor: inactiveTrackColor,
                      onChanged: (val) => setState(() => pushNotifications = val),
                    ),
                    SwitchListTile(
                      title: Text(AppLocalizations.of(context)!.promotional_notifications, style: TextStyle(color: textColor)),
                      value: promotionalNotifications,
                      activeColor: Colors.green,
                      inactiveThumbColor: inactiveThumbColor,
                      inactiveTrackColor: inactiveTrackColor,
                      onChanged: (val) => setState(() => promotionalNotifications = val),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: cardColor,
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
                          color: textColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline, color: iconColor),
                      title: Text(AppLocalizations.of(context)!.help_center, style: TextStyle(color: textColor)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
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
