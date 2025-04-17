import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/screen/order_checkout_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreen();
}

class _CardScreen extends State<CardScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expire = TextEditingController();
  TextEditingController cvc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * (26 / 932),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.add_card,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (390 / 430),
                height: MediaQuery.of(context).size.height * (222 / 932),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/card.png',
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.name,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: isDarkMode ? Colors.white70 : Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InputWidget(
                  textEditingController: name,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.card_number,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: isDarkMode ? Colors.white70 : Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InputWidget(
                  textEditingController: cardNumber,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(17),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  suffixIcon: Image.asset(
                    'assets/images/cardsLogo.png',
                  ),

                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextWidget(
                      text: AppLocalizations.of(context)!.expire,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: isDarkMode ? Colors.white70 : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 140),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextWidget(
                      text: "CVC",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: isDarkMode ? Colors.white70 : Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InputWidget(
                        textEditingController: expire,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(5),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                        ],

                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InputWidget(
                        textEditingController: cvc,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (320 / 430),
                height: MediaQuery.of(context).size.height * (40 / 932),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.successfully_payment,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
                    fontColor: isDarkMode ? Colors.grey[400] : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * (390 / 430),
                  height: MediaQuery.of(context).size.height * (57 / 932),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.green[800] : Colors.green,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode ? Colors.green[900]! : Colors.green,
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          bottomNavigationBarController.changeWidget(
                            widget: OrderDoneCheckout(),
                          );
                          bottomNavigationBarController.changeIndex(index: -1);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 90),
                            Image.asset(
                            'assets/images/lock.png',
                            ),
                            const SizedBox(width: 10),
                            Text(
                              AppLocalizations.of(context)!.pay_for_the_order,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}