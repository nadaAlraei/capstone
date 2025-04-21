import 'package:capstone/theme_controller.dart';
import 'package:capstone/view/screen/all_screen.dart';
import 'package:capstone/view/screen/burger_screen.dart';
import 'package:capstone/view/screen/pizza_screen.dart';
import 'package:capstone/view/screen/sandwich_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
       // backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
         // backgroundColor: Colors.white,

          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            //unselectedLabelColor: Colors.black,
            //labelColor: Colors.white,
            padding: EdgeInsets.only(left: 10,right: 10),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: Color.fromARGB(255, 37, 174, 75),
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorWeight: 0,
         //   dividerColor: Colors.white,
            dividerHeight: 0,
            tabs: [
              // All
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.13,

                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255,219, 244, 209)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: AppLocalizations.of(context)!.all,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'Poppins-Regular',
                      letterSpacing: -0.03,
                    ),
                  ),
                ),
              ),
              // Burger
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255,219, 244, 209)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                ),
              ),
              // Pizza
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255,219, 244, 209)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/pizzaIcon.png'),

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
              ),
              // Sandwich
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255,219, 244, 209)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/sandwishIcon.png'),
                        SizedBox(width:10),
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
                ),
              ),
            ],
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
