import 'package:capstone/view/widget/timeline_tile_widget.dart';
import 'package:flutter/material.dart';
import '../widget/text_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreen();
}

class _OrderDetailsScreen extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * (26 / 932),
                child: TextWidget(
                  text: "Order Details",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Image.asset(
                      'assets/images/takeaway.png', width: 50, height: 50),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Order ID",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                      ),
                      TextWidget(
                        text: "#6579-6432",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: Colors.grey,
                      ),
                      TextWidget(
                        text: "25m",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * ( 335 / 430),
                height: MediaQuery.of(context).size.height * (80 / 932),
                child: TimelineTileWidget(
                    isFirst: true,
                    isLast: false,
                    icon: Icons.check,
                    text: " Order received ",
                    isCompleted: true),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * ( 335 / 430),
                height: MediaQuery.of(context).size.height * (80 / 932),
                child: TimelineTileWidget(
                    isFirst: true,
                    isLast: false,
                    icon: Icons.store,
                    text: " Cooking your order ",
                    isCompleted: true),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * ( 335 / 430),
                height: MediaQuery.of(context).size.height * (80 / 932),
                child: TimelineTileWidget(
                    isFirst: true,
                    isLast: false,
                    icon: Icons.person,
                    text: " Courier is picking up order",
                    isCompleted: true),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * ( 335 / 430),
                height: MediaQuery.of(context).size.height * (80 / 932),
                child: TimelineTileWidget(
                    isFirst: true,
                    isLast: true,
                    icon: Icons.home,
                    text: " Order delivered",
                    isCompleted: false),
              ),

              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * ( 40 / 430),
                      height: MediaQuery.of(context).size.height * (40 / 932),
                      child: Image.asset('assets/images/photo.jpg')),

                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ( 110 / 430),
                        height: MediaQuery.of(context).size.height * (28 / 932),
                        child: TextWidget(
                            text: " Your Delivery Hero",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: 'Intern',
                            letterSpacing: -0.2,
                            fontColor: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * ( 88 / 430),
                            height: MediaQuery.of(context).size.height * (20 / 932),
                            child: TextWidget(
                              text: "Aleksandr V.",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: 'Intern',
                              letterSpacing: -0.2,
                              fontColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * ( 12 / 430),
                              height: MediaQuery.of(context).size.height * (11.4 / 932),
                              child: Image.asset('assets/images/star.png')),
                          SizedBox(width: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * ( 20 / 430),
                            height: MediaQuery.of(context).size.height * (16 / 932),
                            child: TextWidget(
                                text: '4.9',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                fontFamily: "Intern",
                                letterSpacing: -0.2,
                                fontColor: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Container(
                          width: MediaQuery.of(context).size.width * (50 / 430),
                          height: MediaQuery.of(context).size.height * (60 / 932),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon_Phone.png')
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * (50 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/Icon_Chat.png')
                        ),
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width * (263 / 430),
                height: MediaQuery.of(context).size.height * (34 / 932),
                child: TextWidget(
                    text: "Your Location",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Inter",
                    letterSpacing: -0.1,
                  fontColor: Colors.grey,
                ),
              ),

              Row(
                children: [
                  Image.asset('assets/images/ri_map-pin-5-line.png'),
                  SizedBox(width: 5,),
                  TextWidget(
                    text: "123 Al-Madina Street, Abdali, Amman, Jordan",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Inter",
                    letterSpacing: -0.1,
                    fontColor: Colors.black,
                  ),

                ],
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width* (295/ 430),
                  height: MediaQuery.of(context).size.height* (48/ 932),
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
                          onTap: () {},
                          child:
                          Row(children: [
                            SizedBox(width: 110,),
                            Text(
                              "Live Track",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),],)



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