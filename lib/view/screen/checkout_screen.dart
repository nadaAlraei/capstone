
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
    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * (26 / 932),
                  child: TextWidget(
                      text: "Checkout",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: Colors.black)),
              SizedBox(height: 10),
              TextWidget(
                  text: "Pay With:",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: Colors.black),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/Icon maps A.png'),
                      SizedBox(width: 10,),
                      TextWidget(text: "88 Zurab Gorgiladze St", fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Inter', letterSpacing: -0.2, fontColor: Colors.black)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      TextWidget(text: "Georgia, Batumi", fontWeight: FontWeight.w400, fontSize: 13, fontFamily: 'Inter', letterSpacing: -0.2, fontColor: Colors.grey)
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/Icon maps B.png'),
                      SizedBox(width: 10,),
                      TextWidget(text: "5 Noe Zhordania St", fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Inter', letterSpacing: -0.2, fontColor: Colors.black)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      TextWidget(text: "Georgia, Batumi", fontWeight: FontWeight.w400, fontSize: 13, fontFamily: 'Inter', letterSpacing: -0.2, fontColor: Colors.grey),
                      SizedBox(width: 140,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width* (80/ 430),
                        height: MediaQuery.of(context).size.height* (35/ 932),
                        child: TextButton(onPressed: () {
                          bottomNavigationBarController.changeWidget(
                            widget: MapScreen(),
                          );
                          bottomNavigationBarController.changeIndex(index: -1);
                          },
                            child: Text("Change", style: TextStyle(color: Colors.green),)),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  TextWidget(
                      text: "Promo Code?",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: Colors.black),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InputWidget(
                      textEditingController: _promocode,
                      obscureText: false,
                      hintText: "Enter Your Promo",
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
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 21),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextWidget(
                      text: "Pay With:",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: Colors.black),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _selectedPayment = "Card"),
                    child: Row(
                      children: [
                        Radio(
                          value: "Card",
                          groupValue: _selectedPayment,
                          onChanged: (value) => setState(() => _selectedPayment = value.toString()),
                          activeColor: Colors.green,
                        ),
                        Text("Card"),
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
                          activeColor: Colors.green,
                        ),
                        Text("Cash"),
                      ],
                    ),
                  ),
                ],
              ),
          if (_selectedPayment == "Card") ...[
    Column(
                children: [
                  TextWidget(
                      text: "Card Type:",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: Colors.black),
                ],
              ),
            Row(
                children: [
                    GestureDetector(
                      onTap: () => setState(() => _Cards = "MasterCard"),
                      child: Row(
                        children: [
                          Radio(
                            value: "MasterCard",
                            groupValue: _Cards,
                            onChanged: (value) =>
                                setState(() => _Cards = value.toString()),
                            activeColor: Colors.green,
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
                            onChanged: (value) =>
                                setState(() => _Cards = value.toString()),
                            activeColor: Colors.green,
                          ),
                          Image.asset('assets/images/Visa.png'),
                        ],
                      ),
                    ),
                  ]
              ),
              ],
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * (206 / 932),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 174, 75),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
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
                                    text:
                                    AppLocalizations.of(
                                      context,
                                    )!.delivery_charge,
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
                        ],
                      ),
                    ),
                    Positioned(
                        left: 20,
                        bottom: 22,
                        child: GestureDetector(
                          onTap: () {

                            if (_selectedPayment == "Card") {
                              bottomNavigationBarController.changeWidget(
                                widget: CardScreen(),
                              );
                              bottomNavigationBarController.changeIndex(index: -1);
                            } else if (_selectedPayment == "Cash"){
                              bottomNavigationBarController.changeWidget(
                                widget: OrderDoneCheckout(),
                              );
                              bottomNavigationBarController.changeIndex(index: -1);
                            }

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Place My Order",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )

                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}