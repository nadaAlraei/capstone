import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/controller/change_lang_controller.dart';
import 'package:capstone/controller/counter_controller.dart';
import 'package:capstone/controller/location_permission_controller.dart';
import 'package:capstone/controller/offer_slider_controller.dart';
import 'package:capstone/controller/onboarding_controller.dart';
import 'package:capstone/controller/remove_item_controller.dart';
import 'package:capstone/controller/reset_password_controller.dart';
import 'package:capstone/controller/signup_controller.dart';
import 'package:capstone/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'controller/login_controller.dart';
import 'controller/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(
          create: (context) => LocationPermissionController(),
        ),
        ChangeNotifierProvider(create: (context) => SignUpController()),
        ChangeNotifierProvider(create: (context) => ResetPasswordController()),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationBarController(),
        ),
        ChangeNotifierProvider(create: (context) => ChangeLangController()),
        ChangeNotifierProvider(create: (context) => OnboardingController()),
        ChangeNotifierProvider(create: (context) => OfferSliderController()),
        ChangeNotifierProvider(create: (context) => RemoveItemController()),
        ChangeNotifierProvider(create: (context) => CounterController()),
        ChangeNotifierProvider(create: (context) => ThemeController()),
      ],
      child: Consumer<ChangeLangController>(
        builder: (context, changeLangController, child) {
          Intl.defaultLocale = changeLangController.locale.toString();
         return Consumer<ThemeController>(
           builder: (context,themeController,child){
             return MaterialApp(
             title: '',
             locale: changeLangController.locale,
         localizationsDelegates: AppLocalizations.localizationsDelegates,
         supportedLocales: AppLocalizations.supportedLocales,
               theme: themeController.themeData,
               darkTheme: themeController.dark,
               themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,         debugShowCheckedModeBanner: false,
         home: SplashScreen(),
         );
         },
         );
        },
      ),
    );
  }
}
