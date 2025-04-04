import 'package:capstone/model/product_item_model.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget pageContent = Text('');
    List<ProductItemModel> productList = [
        ProductItemModel(price: 20.00, imageUrl: 'assets/images/cartProduct1.png', description: AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),
        ProductItemModel(price: 20.00, imageUrl: 'assets/images/cartProduct2.png', description:AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),
        ProductItemModel(price: 20.00, imageUrl: 'assets/images/cartProduct3.png', description: AppLocalizations.of(context)!.product_ing, name: AppLocalizations.of(context)!.pepperoni_pizza),

    ];
    if (productList.isNotEmpty) {
      pageContent = Stack(
        children: [
          ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.135,
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
                    // product details
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
                        // product description
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                    Column(
                      children: [
                        SizedBox(height: 15),
                        // time
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 12,
                              color: Color.fromARGB(255, 37, 174, 75),
                            ),
                            SizedBox(width: 5),
                            TextWidget(
                              text: '25.3.2024',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Poppins-Regular',
                              letterSpacing: 0,
                              fontColor: Color.fromARGB(155, 59, 59, 59),
                            ),
                          ],
                        ),
                        SizedBox(height: 9),
                        // reorder
                        Row(
                          children: [
                            Icon(
                              Icons.refresh,
                              size: 12,
                              color: Color.fromARGB(255, 37, 174, 75),
                            ),
                            SizedBox(width: 5),
                            TextWidget(
                              text: AppLocalizations.of(context)!.reorder,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Poppins-Regular',
                              letterSpacing: 0,
                              fontColor: Color.fromARGB(255, 37, 174, 75),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          // Load more
          Center(
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
              child: TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: AppLocalizations.of(context)!.load_more,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  letterSpacing: 0.5,
                  fontColor: Color.fromARGB(255, 37, 174, 75),
                ),
              ),
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
              text: AppLocalizations.of(context)!.history_empty,
              fontWeight: FontWeight.w700,
              fontSize: 32,
              fontFamily: 'Inter',
              letterSpacing: -0.02,
            ),
            SizedBox(height: 10),
            TextWidget(
              text: AppLocalizations.of(context)!.empty_product_history,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Inter',
              letterSpacing: -0.02,
              fontColor: Color.fromARGB(255, 108, 114, 120),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return Scaffold(backgroundColor: Colors.white, body: pageContent);
  }
}
