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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      ],
      child: Consumer<ChangeLangController>(
        builder: (context, changeLangController, child) {
          Intl.defaultLocale = changeLangController.locale.toString();
          return MaterialApp(
            title: '',
            locale: changeLangController.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.green,
              colorScheme: ColorScheme.light(
                primary: Colors.green,
                secondary: Colors.greenAccent,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData.dark().copyWith(
              primaryColor: Colors.green[800],
              colorScheme: ColorScheme.dark(
                primary: Colors.green[800]!,
                secondary: Colors.greenAccent[700]!,
              ),
              scaffoldBackgroundColor: Colors.grey[900],
            ),
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
