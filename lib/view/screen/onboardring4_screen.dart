import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/onboardring_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboardring4Screen extends StatelessWidget {
  const Onboardring4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnboardringBaseWidget(
        backgroundImageURL: 'assets/images/onbordaringBackground4.png',
        onboardringImage: 'assets/images/onbordaring2_3_4.png',
        onboardringImageHeight: MediaQuery.of(context).size.height * 0.28,
        onboardringTitle: AppLocalizations.of(context)!.onboardring4_title,
        onboardringSubTitle: AppLocalizations.of(context)!.onboardring4_des,
        nextPage: LoginScreen(),
        onboardringImageMarginTop: MediaQuery.of(context).size.height * 0.265,
        titleFontWeight: FontWeight.w700,
        sizeBoxHeight: 10,
        button1Text: AppLocalizations.of(context)!.yes_turn_it_on,
        underSubTitle: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: TextButton(
            onPressed: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.setBool('hasSeenOnboarding', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              });
            },
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
