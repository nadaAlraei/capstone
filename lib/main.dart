import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/controller/location_permission_controller.dart';
import 'package:capstone/controller/reset_password_controller.dart';
import 'package:capstone/controller/signup_controller.dart';
import 'package:capstone/view/screen/cart_screen.dart';
import 'package:capstone/view/screen/checkout_screen.dart';
import 'package:capstone/view/screen/main_cart_history_screen.dart';
import 'package:capstone/view/screen/main_screen.dart';
import 'package:capstone/view/screen/onboardring1_screen.dart';
import 'package:capstone/view/screen/profile1_screen.dart';
import 'package:capstone/view/screen/splash_screen.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool? hasSeenOnboarding;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => LocationPermissionController()),
        ChangeNotifierProvider(create: (context) => SignUpController()),
        ChangeNotifierProvider(create: (context) => ResetPasswordController()),
        ChangeNotifierProvider(create: (context) => BottomNavigationBarController()),
      ],
      child: MaterialApp(
        title: '',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home:
       SplashScreen(),
      ),
    );
  }
}
