import 'package:capstone/controller/location_permission_controller.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OnBoardingBaseWidget extends StatelessWidget {
  final String title,
      description,
      stackImage,
      onBoardingImg,
      firstButtonText,
      secondButtonText;
  final VoidCallback onPressedOne, onPressedTwo;
  final bool isVisible;
  final double imageHeight, imageWidth, top;

  OnBoardingBaseWidget({
    super.key,
    required this.title,
    required this.description,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.onPressedOne,
    required this.onPressedTwo,
    required this.isVisible,
    required this.imageHeight,
    required this.imageWidth,
    required this.top,
    required this.stackImage,
    required this.onBoardingImg,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.asset(stackImage),

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
              top: MediaQuery.of(context).size.height * 0.25,
            ),
            child: Column(
              children: [
                // Text Container
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Column(
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Color.fromARGB(255, 69, 90, 100),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Description (Sub title)
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                            color: Color.fromARGB(255, 69, 90, 100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 307,
                  height: 58,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 37, 174, 75),
                        Color.fromARGB(255, 15, 72, 31),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: onPressedOne,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // Keep button transparent
                      shadowColor: Colors.transparent,
                      // Remove shadow
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      firstButtonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                // button two
                Visibility(
                  visible: isVisible,
                  child: SizedBox(
                    width: 306,
                    height: 58,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          194,
                          194,
                          194,
                        ),
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 14,
                        ),
                      ),
                      onPressed: onPressedTwo,
                      child: Text(
                        secondButtonText,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Image over Text and Button container
        Container(
          margin: EdgeInsets.only(
            top: top,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Image.asset(
            onBoardingImg,
            width: MediaQuery.of(context).size.width * 0.8,
            height: imageHeight,
          ),
        ),
      ],
    );

  }
}
