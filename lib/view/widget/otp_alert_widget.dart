import 'package:capstone/view/screen/confirm_rest_password_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OTPAlertWidget extends StatelessWidget {
  const OTPAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image.asset("assets/images/otp_logo.png"),
          SizedBox(height: 30),
          TextWidget(
            textAlign: TextAlign.center,
            text: AppLocalizations.of(context)!.otp_message,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Inter',
            letterSpacing: -0.02,
            fontColor: Colors.grey,
          ),
          SizedBox(height: 20),

          // OTP Input Field
          SizedBox(
            width: MediaQuery.of(context).size.width * (260/430),
            height: MediaQuery.of(context).size.height *(80/932),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 53,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.white
              ),
              enableActiveFill: true,
            ),
          ),

          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmRestPasswordScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 174, 75),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextWidget(
                text: AppLocalizations.of(context)!.verify,
                fontWeight: FontWeight.w400,
                fontSize: 20,
                fontFamily: 'Inter',
                letterSpacing: -0.02,
                fontColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
