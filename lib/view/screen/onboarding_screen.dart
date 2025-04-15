import 'package:capstone/controller/location_permission_controller.dart';
import 'package:capstone/controller/onboarding_controller.dart';
import 'package:capstone/model/onboarding_model.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/widget/on_boarding_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    LocationPermissionController locationPermissionController =
        Provider.of<LocationPermissionController>(context, listen: false);

    List<OnboardingModel> onBoarding = [
      OnboardingModel(
        backgroundImage: 'assets/images/Pattern.png',
        image: 'assets/images/onbordaring1.png',
        title: AppLocalizations.of(context)!.onboardring1_title,
        button1Text: AppLocalizations.of(context)!.continu,
        des: AppLocalizations.of(context)!.onboardring1_des,
      ),
      OnboardingModel(
        backgroundImage: 'assets/images/Pattern.png',
        image: 'assets/images/onbordaring2_3_4.png',
        title: AppLocalizations.of(context)!.onboardring2_title,
        button1Text: AppLocalizations.of(context)!.continu,
        des: AppLocalizations.of(context)!.onboardring2_des,
      ),
      OnboardingModel(
        backgroundImage: 'assets/images/Pattern.png',
        image: 'assets/images/onbordaring2_3_4.png',
        title: AppLocalizations.of(context)!.onboardring3_title,
        button1Text: AppLocalizations.of(context)!.continu,
        des: AppLocalizations.of(context)!.onboardring3_des,
      ),
      OnboardingModel(
        backgroundImage: 'assets/images/onbordaringBackground4.png',
        image: 'assets/images/onbordaring2_3_4.png',
        title: AppLocalizations.of(context)!.onboardring4_title,
        button1Text: AppLocalizations.of(context)!.yes_turn_it_on,
        des: AppLocalizations.of(context)!.onboardring4_des,
      ),
    ];

    // one time OnBoarding screen
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<OnboardingController>(
        builder: (context, onboardingController, child) {
          return PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              onboardingController.updatePage(index);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return OnBoardingBaseWidget(
                stackImage: onBoarding[index].backgroundImage,
                onBoardingImg: onBoarding[index].image,
                top: MediaQuery.of(context).size.height * 0.20,
                imageWidth: MediaQuery.of(context).size.width,
                imageHeight: MediaQuery.of(context).size.height * 0.3,
                title: onBoarding[index].title,
                description: onBoarding[index].des,
                firstButtonText: onBoarding[index].button1Text,
                onPressedOne: () async {
                  if (onboardingController.isLast) {
                    locationPermissionController.checkLocationServices();
                    locationPermissionController.determinePosition();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } else {
                    // else it continues to the next screen
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                secondButtonText: AppLocalizations.of(context)!.cancel,
                onPressedTwo: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                isVisible: onboardingController.isLast,
              );
            },
          );
        },
      ),

      bottomSheet: Consumer<OnboardingController>(
        builder: (context, onboardingController, child) {
          return onboardingController
                  .isLast // if its the last page remove the bottom sheet
              ? SizedBox()
              : Container(
                height: 150,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        locationPermissionController.checkLocationServices();
                        locationPermissionController.determinePosition();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Center(
                      // the three dots in the middle
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          spacing: 16,
                          dotColor: Colors.black12,
                          activeDotColor: Color.fromARGB(255, 37, 174, 75),
                        ),
                        onDotClicked: (index) {
                          pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                    IconButton(
                      // to move on page at a time
                      onPressed: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.arrow_forward, color: Color.fromARGB(255, 37, 174, 75)),
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}
