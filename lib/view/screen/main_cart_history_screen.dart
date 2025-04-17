import 'package:capstone/view/screen/cart_screen.dart';
import 'package:capstone/view/screen/history_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainCartHistoryScreen extends StatelessWidget {
  MainCartHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
    final unselectedLabelColor = isDarkMode ? Colors.grey[500] : Color.fromARGB(255, 152, 160, 180);
    final selectedLabelColor = Color.fromARGB(255, 37, 174, 75);
    final indicatorColor = Color.fromARGB(255, 37, 174, 75);
    final dividerColor = isDarkMode ? Colors.grey[800] : Colors.white;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: backgroundColor,
          bottom: TabBar(
            unselectedLabelColor: unselectedLabelColor,
            labelColor: selectedLabelColor,
            padding: EdgeInsets.only(left: 10, right: 10),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: indicatorColor,
            dividerColor: dividerColor,
            tabs: [
              TextWidget(
                text: AppLocalizations.of(context)!.cart,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Inter',
                letterSpacing: 0,
                fontColor: null,
              ),
              TextWidget(
                text: AppLocalizations.of(context)!.history,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Inter',
                letterSpacing: 0,
                fontColor: null,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CartScreen(),
            HistoryScreen(),
          ],
        ),
      ),
    );
  }
}