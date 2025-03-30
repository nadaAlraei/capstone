import 'package:capstone/view/screen/all_screen.dart';
import 'package:capstone/view/screen/burger_screen.dart';
import 'package:capstone/view/screen/pizza_screen.dart';
import 'package:capstone/view/screen/sandwich_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
          child: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
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
              labelPadding: EdgeInsets.only(right: 10,left: 5),
              tabs: [
                // All
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.046,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 219, 244, 209),
                    ),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: AppLocalizations.of(context)!.all,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'Poppins-Regular',
                      letterSpacing: -0.03,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Burger
                Container(
                  width: MediaQuery.of(context).size.width * 0.32,
                  height: MediaQuery.of(context).size.height * 0.046,
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
                        text: AppLocalizations.of(context)!.burger,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        letterSpacing: -0.03,
                      ),
                    ],
                  ),
                ),
                // Pizza
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.046,
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
                        text: AppLocalizations.of(context)!.pizza,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        letterSpacing: -0.03,
                      ),
                    ],
                  ),
                ),
                // Sandwich
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.046,
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
                        text: AppLocalizations.of(context)!.sandwich,
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
            BurgerScreen(),
            PizzaScreen(),
            SandwichScreen(),
          ],
        ),
      ),
    );
  }
}
