import 'package:capstone/model/product_item_model.dart';
import 'package:capstone/view/screen/checkout_screen.dart';
import 'package:capstone/view/widget/counter_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget pageContent = Text('');
    List<ProductItemModel> productList = [
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/cartProduct1.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/cartProduct2.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/cartProduct3.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
      ProductItemModel(
        price: 20.00,
        imageUrl: 'assets/images/cartProduct3.png',
        description: AppLocalizations.of(context)!.product_ing,
        name: AppLocalizations.of(context)!.pepperoni_pizza,
      ),
    ];

    // appear depending on list content
    if (productList.isNotEmpty) {
      pageContent = Stack(
        children: [
          ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.14,

                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255, 219, 244, 209)),
                ),
                child: Row(
                  children: [
                    // Image
                    Image.asset(
                      productList[index].imageUrl,
                      width: 62,
                      height: 62,
                    ),
                    SizedBox(width: 15),
                    // product name & description & price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        // product name
                        TextWidget(
                          text: productList[index].name,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                        ),
                        // product sub title
                        TextWidget(
                          text: 'Burger Factory LTD',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                          fontColor: Color.fromARGB(155, 59, 59, 59),
                        ),
                        // product price
                        TextWidget(
                          text: '# ${productList[index].price}',
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                          fontColor: Color.fromARGB(255, 37, 174, 75),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    // counter
                    CounterWidget(),
                  ],
                ),
              );
            },
          ),

          // order card details
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 37, 174, 75),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.41, left: 20, right: 20),
            child: Stack(
              children: [
                // card background pattern
                Image.asset(
                  'assets/images/cartPattern.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Column(
                    children: [
                      // Details
                      Row(
                        children: [
                          // titles
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // sub_total
                              TextWidget(
                                text: AppLocalizations.of(context)!.sub_total,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              // delivery charge
                              TextWidget(
                                text: AppLocalizations.of(context)!.delivery_charge,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              // discount
                              TextWidget(
                                text: AppLocalizations.of(context)!.discount,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 10),
                              // total
                              TextWidget(
                                text: AppLocalizations.of(context)!.total,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(width: 160),
                          // amount
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: '100 #',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              TextWidget(
                                text: '10 #',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              TextWidget(
                                text: '10 #',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 10),
                              TextWidget(
                                text: '110 #',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(),));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: AppLocalizations.of(context)!.place_my_order,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              letterSpacing: 0.5,
                              fontColor: Color.fromARGB(255, 37, 174, 75),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      pageContent = Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset('assets/images/empty.png'),
            TextWidget(
              text: AppLocalizations.of(context)!.empty_cart,
              fontWeight: FontWeight.w700,
              fontSize: 32,
              fontFamily: 'Inter',
              letterSpacing: -0.02,
            ),
            SizedBox(height: 10),
            TextWidget(
              text: AppLocalizations.of(context)!.empty_product_cart,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Inter',
              letterSpacing: -0.02,
              fontColor: Color.fromARGB(255, 108, 114, 120),
            ),
          ],
        ),
      );
    }


    return Scaffold(backgroundColor: Colors.white, body: pageContent);
  }
}
