import 'package:capstone/model/offer_item_model.dart';
import 'package:capstone/model/recommanded_item_model.dart';
import 'package:capstone/model/top_rated_item_model.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class AllScreen extends StatelessWidget {
  AllScreen({super.key});

  List<OfferItemModel> offerItem = [
    OfferItemModel(
      imageURL: 'assets/images/photoPizza.png',
      description: 'Experience our\ndelicious new dish',
      offerValue: '30%',
    ),
    OfferItemModel(
      imageURL: 'assets/images/photoPizza.png',
      description: 'Experience our\ndelicious new dish',
      offerValue: '30%',
    ),
    OfferItemModel(
      imageURL: 'assets/images/photoPizza.png',
      description: 'Experience our\ndelicious new dish',
      offerValue: '30%',
    ),
    OfferItemModel(
      imageURL: 'assets/images/photoPizza.png',
      description: 'Experience our\ndelicious new dish',
      offerValue: '30%',
    ),
    OfferItemModel(
      imageURL: 'assets/images/photoPizza.png',
      description: 'Experience our\ndelicious new dish',
      offerValue: '30%',
    ),
  ];
  List<TopRatedItemModel> topRatedItem =[
    TopRatedItemModel(imageURL: 'assets/images/chickenBurger.png', price: 20.00, ingredients: '100 gr chicken + tomato + cheese  Lettuce', itemName: 'Chicken Burger', reatedValue: 3.5),
    TopRatedItemModel(imageURL: 'assets/images/cheeseBurger.png', price: 18.00, ingredients: '100 gr chicken + tomato + cheese  Lettuce', itemName: 'Chicken Burger', reatedValue: 4.5),
    TopRatedItemModel(imageURL: 'assets/images/chickenBurger.png', price: 20.00, ingredients: '100 gr chicken + tomato + cheese  Lettuce', itemName: 'Chicken Burger', reatedValue: 3.5),
  ];
  List<RecommendedItemModel> recommendedItemModel = [
    RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended1.png'),
    RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended2.png'),
    RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended3.png'),
    RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended4.png')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Offer Section
            Container(
              width: 370,
              height: 137,
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerItem.length,

                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10,right: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          height: 137,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 37, 174, 75),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              TextWidget(
                                text: offerItem[index].description,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                letterSpacing: 0,
                                textAlign: TextAlign.center,
                                fontColor: Colors.white,
                              ),
                              SizedBox(height: 5),
                              TextWidget(
                                text: '${offerItem[index].offerValue} OFF',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                fontFamily: 'Inter',
                                letterSpacing: 0,
                                textAlign: TextAlign.center,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 137,
                          child: Image.asset(
                            offerItem[index].imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),
            // Top rated
            
            // Top rated title
            Row(
              children: [
                SizedBox(width: 25),
                TextWidget(text: 'Top Rated', fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0),
              ],
            ),

            // Top rated
            Container(
              //width: 370,
              height: 209,
              margin: EdgeInsets.only(top: 20, left: 5, right: 5),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedItem.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 155,
                          height: 209,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255,219, 244, 209)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,color: Color.fromARGB(255,255, 159, 6),size: 16,),
                                  SizedBox(width: 4),
                                  TextWidget(text: topRatedItem[index].reatedValue.toString(), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0)
                                ],
                              ),
                              Center(child: Image.asset(topRatedItem[index].imageURL,height: 76,)),
                              TextWidget(text: topRatedItem[index].itemName, fontWeight: FontWeight.w500, fontSize: 18, fontFamily: 'Inter', letterSpacing: -0.03,fontColor: Colors.black,),
                              SizedBox(height: 5),
                              TextWidget(text: topRatedItem[index].ingredients, fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(155,59, 59, 59),),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(text: '& ${topRatedItem[index].price.toString()}', fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'Inter', letterSpacing: -0.03,fontColor: Color.fromARGB(255, 37, 174, 75),),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 37, 174, 75),
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  child: IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 12,color: Colors.white,)),
                                ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),


            SizedBox(height: 15),
            // Recommended title
            Row(
              children: [
                SizedBox(width: 25),
                TextWidget(text: 'Top Recommended', fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0),
              ],
            ),

            // Top rated
            Container(
              height: 108,
              margin: EdgeInsets.only(top: 20, left: 5, right: 5,bottom: 40),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedItemModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 12,right: 12),
                    child: Row(
                      children: [
                        Stack(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Image.asset(recommendedItemModel[index].imageUrl,height: 108,width: 72,),
                            Container(
                              width: 34,
                              height: 18,
                              margin: EdgeInsets.only(top: 75,left: 38),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 37, 174, 75),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: TextWidget(text: '& ${recommendedItemModel[index].price.toString()}', fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Colors.white,)),
                            ),

                          ],
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
