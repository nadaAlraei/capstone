import 'package:capstone/view/screen/checkout_screen.dart';
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
  TextEditingController CardNumber = TextEditingController();
  TextEditingController Expire = TextEditingController();
  TextEditingController cvc = TextEditingController();



  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(

        leading: IconButton(onPressed: () {
          bottomNavigationBarController.changeWidget(
            widget: CheckoutScreen(),
          );
          bottomNavigationBarController.changeIndex(index: -1);
        }, icon: Icon(Icons.arrow_back)),
       // backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: AppLocalizations.of(context)!.add_card,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
            //      fontColor: Colors.black
          ),
              Container(
                width: MediaQuery.of(context).size.width* (390/ 430),
                height: MediaQuery.of(context).size.height* (222/ 932),
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/card.png',),
              ),
              SizedBox(height: 5,),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.name,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
               //     fontColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InputWidget(textEditingController: name, obscureText: false),
              ),),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.card_number,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    letterSpacing: -0.2,
                  //  fontColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InputWidget(
                  textEditingController: CardNumber,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(17),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  suffixIcon: Image.asset('assets/images/cardsLogo.png'),),
              ),),
              Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextWidget(
                        text: AppLocalizations.of(context)!.expire,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        letterSpacing: -0.2,
                   //     fontColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 140,),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextWidget(
                        text: "CVC",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        letterSpacing: -0.2,
                  //      fontColor: Colors.black,
                      ),
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
                        textEditingController: Expire,
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: TextWidget(
                      text: AppLocalizations.of(context)!.successfully_payment,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      letterSpacing: -0.2,
                      fontColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width* (390/ 430),
                  height: MediaQuery.of(context).size.height* (59/ 932),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 4),
                        ),
                      ]
                  ),
                  child: GestureDetector(
                      onTap: () {
                        bottomNavigationBarController.changeWidget(
                          widget: OrderDoneCheckout(),
                        );
                        bottomNavigationBarController.changeIndex(index: -1);
                      },
                      child:
                      Row(
                        children: [ SizedBox(width: 90,),
                          Image.asset('assets/images/lock.png'),
                          SizedBox(width: 10,),
                          Text(
                            AppLocalizations.of(context)!.pay_for_the_order,
                            style: TextStyle(
                           //   color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),],
                      )

                  ),
                ),

              )
            ],

          ),

        ),
      ),
    );
  }
}