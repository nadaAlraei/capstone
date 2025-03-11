import 'package:capstone/controller/location_permission_controller.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class OnboardringBaseWidget extends StatelessWidget {
  String backgroundImageURL;
  String onboardringImage;
  double onboardringImageHeight;
  double onboardringImageMarginTop;
  String onboardringTitle;
  String onboardringSubTitle;
  Widget nextPage;
  FontWeight titleFontWeight;
  Widget underSubTitle;
  double sizeBoxHeight;
  String button1Text;

  OnboardringBaseWidget({
    super.key,
    required this.backgroundImageURL,
    required this.onboardringImage,
    required this.onboardringImageHeight,
    required this.onboardringImageMarginTop,
    required this.onboardringTitle,
    required this.onboardringSubTitle,
    required this.nextPage,
    required this.titleFontWeight,
    required this.underSubTitle,
    required this.sizeBoxHeight,
    required this.button1Text,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        // Background Image
        Image.asset(backgroundImageURL),

        // Texts and Buttons container

        //Main Container
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.3,
          ),
          width: MediaQuery.of(context).size.width,
          // Text and Button Container
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.3,
            ),
            child: Center(
              child: Column(
                children: [
                  // Text Container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        // Title
                        Text(
                          onboardringTitle,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: titleFontWeight,
                            fontFamily: 'Inter',
                            color: Color.fromARGB(255, 69, 90, 100),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Description (Sub title)
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Text(
                            onboardringSubTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                              color: Color.fromARGB(255, 69, 90, 100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Button 1 Container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 37, 174, 75),
                          Color.fromARGB(255, 15, 72, 31),
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (button1Text ==
                            AppLocalizations.of(context)!.yes_turn_it_on) {
                          Provider.of<LocationPermissionController>(context,listen: false).checkLocationServices();
                          if (Provider.of<LocationPermissionController>(context,listen: false).locationStatus ==
                              "Location Services are DISABLED ❌") {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    content: Text(
                                      'Turn on Location from your phone, then close App and reopen it',
                                    ),
                                  ),
                            );
                          } else if (Provider.of<LocationPermissionController>(context,listen: false).locationStatus ==
                              "Location Services are ENABLED ✅") {
                            Provider.of<LocationPermissionController>(context,listen: false).determinePosition().then((onValue) {});
                          }
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => nextPage,
                            ),
                          );
                        }
                      },
                      child: Text(
                        button1Text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: sizeBoxHeight),

                  // Button 2 Container
                  underSubTitle,
                ],
              ),
            ),
          ),
        ),

        // Image over Text and Button container
        Container(
          margin: EdgeInsets.only(
            top: onboardringImageMarginTop,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Image.asset(
            onboardringImage,
            width: MediaQuery.of(context).size.width * 0.8,
            height: onboardringImageHeight,
          ),
        ),
      ],
    );
  }
}

