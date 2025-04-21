import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/controller/remove_item_controller.dart';
import 'package:capstone/model/product_item_model.dart';
import 'package:capstone/view/screen/product_details_screen.dart';
import 'package:capstone/view/widget/search_box_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<ProductItemModel> favoriteList = [
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
    return Consumer<RemoveItemController>(
      builder: (context, removeItemController, child) {
        removeItemController.editItemList(productList: favoriteList);
        return Scaffold(
         // backgroundColor: Colors.white,
          // Search box
          appBar: AppBar(
           // backgroundColor: Colors.white,
            title: SearchBoxWidget(),
          ),
          body: GridView.count(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 0.7, // Adjusts the height
            children: List.generate(favoriteList.length, (index) {
              return TextButton(
                onPressed: () {
                  Provider.of<BottomNavigationBarController>(
                    context,
                    listen: false,
                  ).changeWidget(widget: ProductDetailsScreen());
                  Provider.of<BottomNavigationBarController>(
                    context,
                    listen: false,
                  ).changeIndex(index: -4);
                },
                child: Stack(
                  children: [
                    // name & description & price
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.23,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      decoration: BoxDecoration(
                     //   color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 219, 244, 209),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 60),
                          // product name
                          TextWidget(
                            text: removeItemController.items[index].name,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            letterSpacing: -0.03,
                       //     fontColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          // ingredients
                          TextWidget(
                            text: removeItemController.items[index].description,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                            fontColor: Color.fromARGB(255, 150, 154, 176),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          TextWidget(
                            text:
                                '& ${removeItemController.items[index].price.toString()}',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            letterSpacing: -0.03,
                        //    fontColor: Colors.black,
                          ),
                        ],
                      ),
                    ),

                    // image
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.grey, width: 10),
                      ),
                      margin: EdgeInsets.only(left: 32, right: 32),
                      child: Image.asset(
                        favoriteList[index].imageUrl,
                        width: 70,
                        height: 70,
                      ),
                    ),

                    // add to favorite
                    Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.only(left: 130, top: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 219, 244, 209),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.12,
                                    child: Column(
                                      children: [
                                        TextWidget(
                                          text:
                                              AppLocalizations.of(
                                                context,
                                              )!.remove_from_favorite,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          fontColor: Color.fromARGB(
                                            255,
                                            108,
                                            114,
                                            120,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.05,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              removeItemController.removeItem(
                                               index:  index,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: TextWidget(
                                              text:
                                                  AppLocalizations.of(
                                                    context,
                                                  )!.yes,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              letterSpacing: 0,
                                   //           fontColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 13,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                    ),

                    // order Now
                    Container(
                      width: 95,
                      height: 27,

                      margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: MediaQuery.of(context).size.height * 0.25,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 174, 75),
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
      },
    );
  }
}
