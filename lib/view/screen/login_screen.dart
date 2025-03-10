import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            color: Colors.white,

          ),

          Center(
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
