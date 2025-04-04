import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/text_widget.dart';

class OrderDoneCheckout extends StatefulWidget {
  const OrderDoneCheckout({super.key});

  @override
  State<OrderDoneCheckout> createState() => _orderDoneCheckout();
}

class _orderDoneCheckout extends State<OrderDoneCheckout> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
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
                    fontColor: Colors.black),
              ),

              Container(
                width: MediaQuery.of(context).size.width* (450/ 430),
                height: MediaQuery.of(context).size.height* (450/ 932),
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/congrats.png',),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width *(400 / 430),
                height: MediaQuery.of(context).size.height * (31 / 932),
                child:
                TextWidget(
                  text: "Your Order Done Successfully",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12,),
              SizedBox(
                width: MediaQuery.of(context).size.width* (390/ 430),
                height: MediaQuery.of(context).size.height* (60/ 932),
                child: TextWidget(
                  text: "you will get your order within 12min. \nthanks for using our services",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: Colors.grey,
                  textAlign: TextAlign.center,


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width* (390/ 430),
                    height: MediaQuery.of(context).size.height* (57/ 932),
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
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => OrderDoneCheckout(),));
                            },
                            child:
                            Row(
                              children: [
                                SizedBox(width: 110,),
                                Text(
                                  "Track Your Order",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),],
                            )

                        ),

                      ],
                    ),
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