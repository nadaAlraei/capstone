import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CongratsAlertWidget extends StatelessWidget {
  const CongratsAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
      Color.fromARGB(
        1,
        131,
        131,
        131,
      ),
      content: Column(
        mainAxisAlignment:
        MainAxisAlignment
            .center,
        children: [
          Image.asset(
            "assets/images/congrats.png",
          ),
          SizedBox(height: 50),
          TextWidget(
            text:
            AppLocalizations.of(
              context,
            )!.congrats,
            fontWeight:
            FontWeight.w700,
            fontSize: 29,
            fontFamily: 'Inter',
            letterSpacing: -0.02,
            fontColor:
            Colors.white,
          ),
          SizedBox(height: 5),
          TextWidget(
            textAlign: TextAlign.center,
            text:
            AppLocalizations.of(
              context,
            )!.password_reset_successfully,
            fontWeight:
            FontWeight.w400,
            fontSize: 18,
            fontFamily: 'Inter',
            letterSpacing: -0.02,
            fontColor:
            Colors.white,
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                      LoginScreen(),
                ),
              );
            },
            child: Container(
              alignment:
              Alignment
                  .center,
              width:
              MediaQuery.of(
                context,
              ).size.width *
                  0.9,
              height:
              MediaQuery.of(
                context,
              ).size.height *
                  0.05,
              decoration: BoxDecoration(
                color:
                Color.fromARGB(
                  255,
                  37,
                  174,
                  75,
                ),
                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),
              child: TextWidget(
                text:
                AppLocalizations.of(
                  context,
                )!.ok2,
                fontWeight:
                FontWeight
                    .w400,
                fontSize: 20,
                fontFamily:
                'Inter',
                letterSpacing:
                -0.02,
                fontColor:
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
