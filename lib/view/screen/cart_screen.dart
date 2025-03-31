import 'package:capstone/model/product_item_model.dart';
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
    if(productList.isNotEmpty){
      pageContent = Stack(
        children: [
          ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Container(
                width: 387,
                height: 103,

                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255, 219, 244, 209)),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      productList[index].imageUrl,
                      width: 62,
                      height: 62,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        TextWidget(
                          text: productList[index].name,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                        ),
                        TextWidget(
                          text: 'Burger Factory LTD',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          letterSpacing: 0,
                          fontColor: Color.fromARGB(155, 59, 59, 59),
                        ),
                        //SizedBox(height: 8),
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
                    Row(
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 219, 244, 209),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.maximize,
                              size: 10,
                              color: Color.fromARGB(255, 37, 174, 75),
                            ),
                          ),
                        ),
                        SizedBox(width: 9),
                        TextWidget(
                          text: '1',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins-Regular',
                          letterSpacing: 0,
                        ),
                        SizedBox(width: 9),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 37, 174, 75),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //padding: EdgeInsets.only(top: 2),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            width: 387,
            height: 206,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 37, 174, 75),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: 335, left: 20, right: 20),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/cartPattern.png',
                  fit: BoxFit.cover,
                  width: 387,
                  height: 206,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Sub-Total',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              TextWidget(
                                text: 'Delivery Charge',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              TextWidget(
                                text: 'Discount',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 10),
                              TextWidget(
                                text: 'Total:',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(width: 160),
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
                        onPressed: () {},
                        child: Container(
                            width: 366,
                            height: 57,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextWidget(
                                text: 'Place My Order',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                letterSpacing: 0.5,
                                fontColor: Color.fromARGB(255, 37, 174, 75),
                              ),
                            )
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
    }else{
    pageContent=  Center(child:
        Column(
          children: [
            SizedBox(height: 50),
            Image.asset('assets/images/empty.png'),
            TextWidget(text: 'Cart Empty', fontWeight: FontWeight.w700, fontSize: 32, fontFamily: 'Inter', letterSpacing: -0.02),
            SizedBox(height: 10),
            TextWidget(text: 'You don’t have add any foods in cart at this time ', fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Inter', letterSpacing: -0.02,fontColor: Color.fromARGB(255,108, 114, 120),),
          ],
        ),);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: pageContent,
    );
  }
}
