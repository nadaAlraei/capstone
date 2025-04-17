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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final primaryColor = theme.primaryColor;
    final tabBorderColor = isDarkMode ? Colors.grey[700]! : const Color.fromARGB(255, 219, 244, 209);
    final unselectedLabelColor = isDarkMode ? Colors.grey[400]! : Colors.black;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          backgroundColor: theme.appBarTheme.backgroundColor,
          bottom: TabBar(
            labelPadding: const EdgeInsets.symmetric(horizontal: 5),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: unselectedLabelColor,
            labelColor: isDarkMode ? Colors.white : Colors.white,
            padding: const EdgeInsets.only(left: 10, right: 10),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorWeight: 0,
            dividerColor: Colors.transparent,
            tabs: [
              // All
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.13,
                  decoration: BoxDecoration(
                    border: Border.all(color: tabBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: AppLocalizations.of(context)!.all,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'Poppins-Regular',
                      letterSpacing: -0.03,
                      fontColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              // Burger
              Tab(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: tabBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/burgerIcon.png',
                          color: isDarkMode ? Colors.white : null,
                        ),
                        const SizedBox(width: 10),
                        TextWidget(
                          text: AppLocalizations.of(context)!.burger,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                          letterSpacing: -0.03,
                          fontColor: isDarkMode ? Colors.white : Colors.black,
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
                    border: Border.all(color: tabBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/pizzaIcon.png',
                        color: isDarkMode ? Colors.white : null,
                      ),
                      const SizedBox(width: 10),
                      TextWidget(
                        text: AppLocalizations.of(context)!.pizza,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        letterSpacing: -0.03,
                        fontColor: isDarkMode ? Colors.white : Colors.black,
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
                    border: Border.all(color: tabBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/sandwishIcon.png',
                          color: isDarkMode ? Colors.white : null,
                        ),
                        const SizedBox(width: 10),
                        TextWidget(
                          text: AppLocalizations.of(context)!.sandwich,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                          letterSpacing: -0.03,
                          fontColor: isDarkMode ? Colors.white : Colors.black,
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