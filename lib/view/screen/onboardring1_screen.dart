import 'package:capstone/view/screen/onboardring2_screen.dart';
import 'package:capstone/view/screen/onboardring4_screen.dart';
import 'package:capstone/view/widget/onboardring_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Onboardring1Screen extends StatelessWidget {
  const Onboardring1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnboardringBaseWidget(
        backgroundImageURL: 'assets/images/Pattern.png',
        onboardringImage: 'assets/images/onbordaring1.png',
        onboardringImageHeight: MediaQuery.of(context).size.height * 0.4,
        onboardringTitle: AppLocalizations.of(context)!.onboardring1_title,
        onboardringSubTitle:
        AppLocalizations.of(context)!.onboardring1_des,
        nextPage: Onboardring2Screen(),
        onboardringImageMarginTop: MediaQuery.of(context).size.height * 0.18,
        titleFontWeight: FontWeight.w500,
        sizeBoxHeight: 45,
        button1Text: AppLocalizations.of(context)!.continu,
        underSubTitle: Container(
          width: MediaQuery.of(context).size.height * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip button
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Onboardring4Screen()),
                  );

                },
                child: Text(
                  AppLocalizations.of(context)!.skip,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 69, 90, 100),
                  ),
                ),
              ),

              // Dots
              Row(children: [
                Icon(Icons.circle, color: Color.fromARGB(255, 37, 174, 75),size: 10,),
                Icon(Icons.circle,color: Colors.grey,size: 10,),
                Icon(Icons.circle,color: Colors.grey,size: 10,),

              ],),

              // Next icon button
              IconButton(
                onPressed: () {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Onboardring2Screen()),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 22,
                  color: Color.fromARGB(255, 37, 174, 75),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
