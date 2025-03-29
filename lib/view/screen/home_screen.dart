import 'package:capstone/view/screen/all_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),

          child: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              //padding: EdgeInsets.zero,
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                color: Color.fromARGB(255, 37, 174, 75),
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorWeight: 0,
              dividerColor: Colors.white,
              labelPadding: EdgeInsets.only(right: 10),
              tabs: [
                Container(
                  width: 49,
                  height: 38,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 219, 244, 209),
                    ),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: 'All',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'Poppins-Regular',
                      letterSpacing: -0.03,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 126,
                  height: 38,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 219, 244, 209),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/burgerIcon.png'),
                      SizedBox(width: 10),
                      TextWidget(
                        text: 'Burger',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        letterSpacing: -0.03,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 111,
                  height: 38,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 219, 244, 209),
                    ),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.asset('assets/images/pizzaIcon.png'),
                      ),

                      TextWidget(
                        text: 'Pizza',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        letterSpacing: -0.03,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 154,
                  height: 38,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 219, 244, 209),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/sandwichIcon.png'),
                      SizedBox(width: 10),
                      TextWidget(
                        text: 'Sandwich',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        letterSpacing: -0.03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: TabBarView(
          children: [
            AllScreen(),
            Text('Burger'),
            Text('Pizza'),
            Text('Sandwich'),
          ],
        ),
      ),
    );
  }
}
