import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/model/product_item_model.dart';
import 'package:capstone/view/screen/product_details_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/search_box_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BurgerScreen extends StatelessWidget {
  BurgerScreen({super.key});

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;
    final borderColor = isDarkMode ? Colors.grey[700]! : const Color.fromARGB(255, 219, 244, 209);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subTextColor = isDarkMode ? Colors.grey[400]! : const Color.fromARGB(255, 150, 154, 176);
    final favoriteBg = isDarkMode ? Colors.grey[700]! : const Color.fromARGB(255, 219, 244, 209);

    List<ProductItemModel> burgerList = [
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/pizza1.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/pizza2.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/pizza3.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/pizza4.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: SearchBoxWidget(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: List.generate(burgerList.length, (index) {
          return TextButton(
            onPressed: () {
              Provider.of<BottomNavigationBarController>(
                context,
                listen: false,
              ).changeWidget(widget: ProductDetailsScreen());
              Provider.of<BottomNavigationBarController>(
                context,
                listen: false,
              ).changeIndex(index: -1);
            },
            child: Stack(
              children: [
                // Card container
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.23,
                  margin: const EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      TextWidget(
                        text: burgerList[index].name,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        letterSpacing: -0.03,
                        fontColor: textColor,
                      ),
                      const SizedBox(height: 5),
                      TextWidget(
                        text: burgerList[index].description,
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        letterSpacing: 0,
                        fontColor: subTextColor!,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      TextWidget(
                        text: '& ${burgerList[index].price.toString()}',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        letterSpacing: -0.03,
                        fontColor: textColor,
                      ),
                    ],
                  ),
                ),

                // Image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: Colors.grey, width: 10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Image.asset(
                    burgerList[index].imageUrl,
                    width: 70,
                    height: 70,
                  ),
                ),

                // Favorite icon
                Container(
                  width: 35,
                  height: 35,
                  margin: const EdgeInsets.only(left: 130, top: 10),
                  decoration: BoxDecoration(
                    color: favoriteBg,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.favorite_border, size: 13),
                ),

                // Order Now button
                Container(
                  width: 95,
                  height: 27,
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: MediaQuery.of(context).size.height * 0.25,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 174, 75),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: AppLocalizations.of(context)!.order_now,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      letterSpacing: 0,
                      fontColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
