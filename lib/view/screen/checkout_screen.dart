import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';
import 'card_screen.dart';
import 'order_checkout_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _promocode = TextEditingController();
  String _selectedPayment = "card";
  String _Cards = "MasterCard";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final backgroundColor = theme.scaffoldBackgroundColor;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryTextColor = isDarkMode ? Colors.grey[400] : Colors.grey[600];
    final accentColor = const Color.fromARGB(255, 37, 174, 75);

    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * (26 / 932),
                    child: TextWidget(
                        text: AppLocalizations.of(context)!.checkout,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        letterSpacing: -0.2,
                        fontColor: textColor)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextWidget(
                    text: AppLocalizations.of(context)!.pay_with,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
                    fontColor: textColor),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/Icon maps A.png'),
                        SizedBox(width: 10),
                        TextWidget(
                            text: "88 Zurab Gorgiladze St",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: textColor)
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        TextWidget(
                            text: "Georgia, Batumi",
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: secondaryTextColor)
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/Icon maps B.png'),
                        SizedBox(width: 10),
                        TextWidget(
                            text: "5 Noe Zhordania St",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: textColor)
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        TextWidget(
                            text: "Georgia, Batumi",
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            fontFamily: 'Inter',
                            letterSpacing: -0.2,
                            fontColor: secondaryTextColor),
                        SizedBox(width: 140),
                        TextButton(
                          onPressed: () {
                            bottomNavigationBarController.changeWidget(
                              widget: MapScreen(),
                            );
                            bottomNavigationBarController.changeIndex(index: -2);
                          },
                          child: Text(
                              AppLocalizations.of(context)!.change,
                              style: TextStyle(color: accentColor)
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    TextWidget(
                        text: AppLocalizations.of(context)!.promo_code,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        letterSpacing: -0.2,
                        fontColor: textColor),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputWidget(
                      textEditingController: _promocode,
                      obscureText: false,
                      hintText: AppLocalizations.of(context)!.enter_your_promo,
                      suffixIcon: TextButton(
                        onPressed: () {
                          String promoCode = _promocode.text.trim();
                          if (promoCode.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added successfully")),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: accentColor,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 21),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.add,
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    TextWidget(
                        text: AppLocalizations.of(context)!.pay_with,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        letterSpacing: -0.2,
                        fontColor: textColor),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _selectedPayment = "Card"),
                      child: Row(
                        children: [
                          Radio(
                            value: "Card",
                            groupValue: _selectedPayment,
                            onChanged: (value) => setState(() => _selectedPayment = value.toString()),
                            activeColor: accentColor,
                          ),
                          Text(AppLocalizations.of(context)!.card, style: TextStyle(color: textColor)),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => setState(() => _selectedPayment = "Cash"),
                      child: Row(
                        children: [
                          Radio(
                            value: "Cash",
                            groupValue: _selectedPayment,
                            onChanged: (value) => setState(() => _selectedPayment = value.toString()),
                            activeColor: accentColor,
                          ),
                          Text(AppLocalizations.of(context)!.cash, style: TextStyle(color: textColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedPayment == "Card") ...[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22,right: 22),
                      child: TextWidget(
                          text: AppLocalizations.of(context)!.card_type,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          letterSpacing: -0.2,
                          fontColor: textColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22,right: 22),
                  child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _Cards = "MasterCard"),
                          child: Row(
                            children: [
                              Radio(
                                value: "MasterCard",
                                groupValue: _Cards,
                                onChanged: (value) => setState(() => _Cards = value.toString()),
                                activeColor: accentColor,
                              ),
                              Image.asset('assets/images/Mastercard.png'),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => setState(() => _Cards = "Visa"),
                          child: Row(
                            children: [
                              Radio(
                                value: "Visa",
                                groupValue: _Cards,
                                onChanged: (value) => setState(() => _Cards = value.toString()),
                                activeColor: accentColor,
                              ),
                              Image.asset('assets/images/Visa.png'),
                            ],
                          ),
                        ),
                      ]
                  ),
                ),
              ],
              // order card details
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 18,
                ),
                child: Stack(
                  children: [
                    // card background pattern
                    Image.asset(
                      'assets/images/cartPattern.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Column(
                        children: [
                          // Details
                          Row(
                            children: [
                              // titles
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // sub_total
                                  TextWidget(
                                    text: AppLocalizations.of(context)!.sub_total,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 5),
                                  // delivery charge
                                  TextWidget(
                                    text: AppLocalizations.of(context)!.delivery_charge,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 5),
                                  // discount
                                  TextWidget(
                                    text: AppLocalizations.of(context)!.discount,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  // total
                                  TextWidget(
                                    text: AppLocalizations.of(context)!.total,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.33,
                              ),
                              // amount
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: '100 #',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 5),
                                  TextWidget(
                                    text: '10 #',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 5),
                                  TextWidget(
                                    text: '10 #',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  TextWidget(
                                    text: '110 #',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.5,
                                    fontColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          TextButton(
                            onPressed: () {
                              if (_selectedPayment == "Card") {
                                bottomNavigationBarController.changeWidget(
                                  widget: CardScreen(),
                                );
                                bottomNavigationBarController.changeIndex(index: -1);
                              } else if (_selectedPayment == "Cash") {
                                bottomNavigationBarController.changeWidget(
                                  widget: OrderDoneCheckout(),
                                );
                                bottomNavigationBarController.changeIndex(index: -1);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.055,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: AppLocalizations.of(context)!.place_my_order,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.5,
                                  fontColor: accentColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}