import 'package:capstone/model/product_item_model.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductItemModel> pizzaList = [
      ProductItemModel(price: 20.00, imageUrl: 'assets/images/pizza2.png', description: AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),
      ProductItemModel(price: 20.00, imageUrl: 'assets/images/pizza2.png', description:AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),
      ProductItemModel(price: 20.00, imageUrl: 'assets/images/pizza2.png', description: AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),
      ProductItemModel(price: 20.00, imageUrl: 'assets/images/pizza2.png', description: AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),
    ];
    return Scaffold(
      backgroundColor: Colors.white,

      body:  ListView.builder(
        itemCount:2,
        padding: EdgeInsets.only(top: 20,left: 21,right: 21,bottom: 20),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Stack(
                  children: [
                    // name & description & price
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.23,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            text: pizzaList[index].name,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            letterSpacing: -0.03,
                            fontColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          // ingredients
                          TextWidget(
                            text: pizzaList[index].description,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                            fontColor: Color.fromARGB(255,150, 154, 176),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          TextWidget(
                            text: '& ${pizzaList[index].price.toString()}' ,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            letterSpacing: -0.03,
                            fontColor: Colors.black,
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
                        pizzaList[index].imageUrl,
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
                      child: Icon(Icons.favorite_border, size: 13),
                    ),

                    // order Now
                    Container(
                      width: 95,
                      height: 27,

                      margin: EdgeInsets.only(left: 30, right: 30, top: 205),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 174, 75),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: TextWidget(text: 'Order Now', fontWeight: FontWeight.w400, fontSize: 10, fontFamily: 'Inter', letterSpacing: 0,fontColor: Colors.white,)),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Stack(
                  children: [
                    // name & description & price
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.23,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            text: pizzaList[index].name,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            letterSpacing: -0.03,
                            fontColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          // ingredients
                          TextWidget(
                            text: pizzaList[index].description,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            letterSpacing: 0,
                            fontColor: Color.fromARGB(255,150, 154, 176),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          TextWidget(
                            text: '& ${pizzaList[index].price.toString()}' ,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            letterSpacing: -0.03,
                            fontColor: Colors.black,
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
                        pizzaList[index].imageUrl,
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
                      child: Icon(Icons.favorite_border, size: 13),
                    ),

                    // order Now
                    Container(
                      width: 95,
                      height: 27,

                      margin: EdgeInsets.only(left: 30, right: 30, top: 205),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 174, 75),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: TextWidget(text: 'Order Now', fontWeight: FontWeight.w400, fontSize: 10, fontFamily: 'Inter', letterSpacing: 0,fontColor: Colors.white,)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
