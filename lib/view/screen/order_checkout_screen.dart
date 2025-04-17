import 'package:capstone/view/screen/map_screen.dart';
import 'package:capstone/view/screen/track_order_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDoneCheckout extends StatefulWidget {
  const OrderDoneCheckout({super.key});

  @override
  State<OrderDoneCheckout> createState() => _orderDoneCheckout();
}

class _orderDoneCheckout extends State<OrderDoneCheckout> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: AppLocalizations.of(context)!.checkout,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Inter',
                letterSpacing: -0.2,
                fontColor: isDarkMode ? Colors.white : Colors.black,
              ),

              Container(
                margin: const EdgeInsets.only(top: 60),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                   'assets/images/congrats.png',
                ),
              ),

              Center(
                child: TextWidget(
                  text: AppLocalizations.of(context)!.your_order_done_successfully,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: isDarkMode ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: MediaQuery.of(context).size.width * (390 / 430),
                height: MediaQuery.of(context).size.height * (60 / 932),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.thanks_for_using_our_services,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: -0.2,
                  fontColor: isDarkMode ? Colors.grey[400] : Colors.grey,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: GestureDetector(
                  onTap: () {
                    bottomNavigationBarController.changeWidget(
                      widget: OrderTrackingScreen(),
                    );
                    bottomNavigationBarController.changeIndex(index: -2);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * (390 / 430),
                    height: MediaQuery.of(context).size.height * (57 / 932),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.green[800] : Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode ? Colors.green[900]! : Colors.green,
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.of(context)!.track_your_order,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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