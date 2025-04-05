import 'package:capstone/view/screen/card_screen.dart';
import 'package:capstone/view/screen/login_screen.dart';
import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/screen/order_checkout_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';

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
                padding: const EdgeInsets.only(bottom: 0),
                color: Colors.green,
                child: Stack(
                  children: [
                    Image.asset('assets/images/BACKGROUND 2.png', color: Colors.white70,),

                    Positioned(
                      left: 14,
                      bottom: 170,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: "Sub-Total",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: -0.2,
                                fontColor: Colors.white,
                              ),
                              SizedBox(width: 250,),
                              TextWidget(
                                  text: "100 \$",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  letterSpacing: -0.2,
                                  fontColor: Colors.white
                              ),],),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 14,
                      bottom: 150,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: "Delivery Charge",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: -0.2,
                                fontColor: Colors.white,
                              ),
                              SizedBox(width: 210,),
                              TextWidget(
                                  text: "10 \$",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  letterSpacing: -0.2,
                                  fontColor: Colors.white
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 14,
                      bottom: 130,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: "Discount",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: -0.2,
                                fontColor: Colors.white,
                              ),
                              SizedBox(width: 257,),
                              TextWidget(
                                  text: "10 \$",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  letterSpacing: -0.2,
                                  fontColor: Colors.white
                              )
                            ],),],),
                    ),
                    Positioned(
                      left: 14,
                      bottom: 100,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: "Total",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                letterSpacing: -0.2,
                                fontColor: Colors.white,
                              ),
                              SizedBox(width: 275,),
                              TextWidget(
                                  text: "10 \$",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                  letterSpacing: -0.64,
                                  fontColor: Colors.white
                              )
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