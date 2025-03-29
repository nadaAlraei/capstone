import 'package:capstone/model/offer_item_model.dart';
import 'package:capstone/model/recommended_item_model.dart';
import 'package:capstone/model/top_rated_item_model.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class AllScreen extends StatelessWidget {
  AllScreen({super.key});

  List<OfferItemModel> offerItem = [
    OfferItemModel(
      description: 'Experience our \ndelicious new dish',
      imageURL: 'assets/images/photoPizza.png',
      offerValue: '30%',
    ),
    OfferItemModel(
      description: 'Experience our \ndelicious new dish',
      imageURL: 'assets/images/photoPizza.png',
      offerValue: '30%',
    ),
    OfferItemModel(
      description: 'Experience our \ndelicious new dish',
      imageURL: 'assets/images/photoPizza.png',
      offerValue: '30%',
    ),
    OfferItemModel(
      description: 'Experience our \ndelicious new dish',
      imageURL: 'assets/images/photoPizza.png',
      offerValue: '30%',
    ),
    OfferItemModel(
      description: 'Experience our \ndelicious new dish',
      imageURL: 'assets/images/photoPizza.png',
      offerValue: '30%',
    ),
  ];
  List<TopRatedItemModel> topRatedItem = [
    TopRatedItemModel(
      imageUrl: 'assets/images/chickenBurger.png',
      ingredients: '100 gr chicken + tomato + cheese  Lettuce',
      itemName: 'Chicken burger',
      price: 20.00,
      rated: 3.5,
    ),
    TopRatedItemModel(
      imageUrl: 'assets/images/cheeseBurger.png',
      ingredients: '100 gr meat + tomato + Lettuce cheese',
      itemName: 'Cheese burger',
      price: 20.00,
      rated: 4.5,
    ),
    TopRatedItemModel(
      imageUrl: 'assets/images/chickenBurger.png',
      ingredients: '100 gr chicken + tomato + cheese  Lettuce',
      itemName: 'Chicken burger',
      price: 20.00,
      rated: 3.5,
    ),
  ];
  List<RecommendedItemModel> recommendedItemModel = [
    RecommendedItemModel(image: 'assets/images/recommended1.png', price: 8.0),
    RecommendedItemModel(image: 'assets/images/recommended2.png', price: 8.0),
    RecommendedItemModel(image: 'assets/images/recommended3.png', price: 8.0),
    RecommendedItemModel(image: 'assets/images/recommended4.png', price: 8.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Offer Section
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.45,
                              color: Color.fromARGB(255, 37, 174, 75),

                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Image.asset(
                                      'assets/images/offerUpCircle.png',
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        TextWidget(
                                          text: offerItem[index].description,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          textAlign: TextAlign.center,
                                          fontColor: Colors.white,
                                        ),
                                        TextWidget(
                                          text:
                                              '${offerItem[index].offerValue} OFF',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                          fontFamily: 'LeagueSpartan',
                                          letterSpacing: 0,
                                          textAlign: TextAlign.center,
                                          fontColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 125),
                                    child: Image.asset(
                                      'assets/images/offerDownCircle.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.45,

                              child: Image.asset(
                                offerItem[index].imageURL,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: offerItem.length,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // Top Rated

            // Top rated title
            Row(
              children: [
                SizedBox(width: 20),
                TextWidget(
                  text: 'Top Rated',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                ),
              ],
            ),

            // Top rated item
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.29,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 10),

                        width: MediaQuery.of(context).size.width * 0.36,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 219, 244, 209),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Color.fromARGB(255, 255, 159, 6),
                                  ),
                                  TextWidget(
                                    text: ' ${topRatedItem[index].rated}',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.03,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Image.asset(
                                  topRatedItem[index].imageUrl,
                                  height: 65,
                                ),
                              ),
                              TextWidget(
                                text: topRatedItem[index].itemName,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'LeagueSpartan',
                                letterSpacing: 0,
                                fontColor: Colors.black,
                              ),
                              TextWidget(
                                text: topRatedItem[index].ingredients,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'LeagueSpartan',
                                letterSpacing: 0,
                                fontColor: Color.fromARGB(255, 59, 59, 59),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: '& ${topRatedItem[index].price}',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    fontFamily: 'LeagueSpartan',
                                    letterSpacing: 0,
                                    fontColor: Color.fromARGB(255, 37, 174, 75),
                                  ),

                                  Container(
                                    width: 30,
                                    height: 30,

                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 37, 174, 75),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,

                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: topRatedItem.length,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            // Recommended title, view all
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextWidget(
                    text: 'Recommended',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'View All ',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        letterSpacing: 0,
                        fontColor: Color.fromARGB(255, 37, 174, 75),
                      ),

                      Icon(Icons.arrow_forward_ios, size: 8,color: Color.fromARGB(255, 37, 174, 75),),
                    ],
                  ),
                ),
              ],
            ),

            // Recommended Item
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10, left: 13, right: 13),

                        //width: MediaQuery.of(context).size.width * 0.36,
                        child: Stack(
                          children: [
                            Image.asset(recommendedItemModel[index].image,width: 72,height: 108,),
                            Container(
                              
                            margin: EdgeInsets.only(top: 70,left: 34),
                              width: 38,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 37, 174, 75),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextWidget(text: recommendedItemModel[index].price.toString(), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,fontColor:Colors.white,),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
