import 'package:capstone/view/screen/cart_screen.dart';
import 'package:capstone/view/screen/history_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class MainCartHistoryScreen extends StatelessWidget {

  MainCartHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,

          bottom: TabBar(

            unselectedLabelColor: Color.fromARGB(255,152, 160, 180),
            labelColor: Color.fromARGB(255, 37, 174, 75),
            padding: EdgeInsets.only(left: 10,right: 10),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor:  Color.fromARGB(255, 37, 174, 75),

            dividerColor: Colors.white,
            tabs: [
              TextWidget(
                text: 'Cart',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Inter',
                letterSpacing: 0,

              ),
              TextWidget(
                text: 'History',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Inter',
                letterSpacing: 0,

              ),
            ],
          ),
        ),
        body: TabBarView(children:[
          CartScreen(),
          HistoryScreen(),
        ]),
      ),
    );
  }
}
