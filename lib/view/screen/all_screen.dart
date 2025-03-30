import 'package:capstone/model/offer_item_model.dart';
import 'package:capstone/model/recommanded_item_model.dart';
import 'package:capstone/model/top_rated_item_model.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllScreen extends StatelessWidget {
  AllScreen({super.key});




  @override
  Widget build(BuildContext context) {

    List<OfferItemModel> offerItem = [
      OfferItemModel(
        imageURL: 'assets/images/photoPizza.png',
        description: AppLocalizations.of(context)!.offerDes,
        offerValue: '30%',
      ),
      OfferItemModel(
        imageURL: 'assets/images/photoPizza.png',
        description: AppLocalizations.of(context)!.offerDes,
        offerValue: '30%',
      ),
      OfferItemModel(
        imageURL: 'assets/images/photoPizza.png',
        description: AppLocalizations.of(context)!.offerDes,
        offerValue: '30%',
      ),
      OfferItemModel(
        imageURL: 'assets/images/photoPizza.png',
        description: AppLocalizations.of(context)!.offerDes,
        offerValue: '30%',
      ),
      OfferItemModel(
        imageURL: 'assets/images/photoPizza.png',
        description: AppLocalizations.of(context)!.offerDes,
        offerValue: '30%',
      ),
    ];
    List<TopRatedItemModel> topRatedItem =[
      TopRatedItemModel(imageURL: 'assets/images/chickenBurger.png', price: 20.00, ingredients: AppLocalizations.of(context)!.ingredients, itemName: AppLocalizations.of(context)!.chicken_burger, reatedValue: 3.5),
      TopRatedItemModel(imageURL: 'assets/images/cheeseBurger.png', price: 18.00, ingredients: AppLocalizations.of(context)!.ingredients, itemName: AppLocalizations.of(context)!.cheese_burger, reatedValue: 4.5),
      TopRatedItemModel(imageURL: 'assets/images/chickenBurger.png', price: 20.00, ingredients: AppLocalizations.of(context)!.ingredients, itemName: AppLocalizations.of(context)!.chicken_burger, reatedValue: 3.5),
    ];
    List<RecommendedItemModel> recommendedItemModel = [
      RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended1.png'),
      RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended2.png'),
      RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended3.png'),
      RecommendedItemModel(price: 8.0, imageUrl: 'assets/images/recommended4.png')
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Offer Section
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.17,
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerItem.length,

                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10,right: 15),
                    child: Row(
                      children: [
                        // offer texts
                        Stack(
                          children: [

                            // offer texts
                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.165,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 37, 174, 75),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  // Offer description
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
                                  // Offer value
                                  TextWidget(
                                    text: '${offerItem[index].offerValue} ${AppLocalizations.of(context)!.off}',
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

                            // upper bracket
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Image.asset(
                                    'assets/images/offerUpCircle.png')),

                            // down bracket
                            Container(
                                margin: EdgeInsets.only(top: 113,right: 132),
                                child: Image.asset('assets/images/offerDownCircle.png')),
                          ],
                        ),
                        // product image
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.46,
                          height: MediaQuery.of(context).size.height * 0.165,
                          child: Image.asset(
                            offerItem[index].imageURL,
                            fit: BoxFit.fill,
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
                TextWidget(text: AppLocalizations.of(context)!.top_rated, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0),
              ],
            ),

            // Top rated

            // Main container
            Container(
              height: MediaQuery.of(context).size.height * 0.277,
              margin: EdgeInsets.only(top: 20, left: 5, right: 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedItem.length,
                itemBuilder: (context, index) {
                  return Container(
                    // Container for each product
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: [
                        //
                        Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: MediaQuery.of(context).size.height * 0.26,
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
                              // Star and rate value
                              Row(
                                children: [
                                  Icon(Icons.star,color: Color.fromARGB(255,255, 159, 6),size: 16,),
                                  SizedBox(width: 4),
                                  TextWidget(text: topRatedItem[index].reatedValue.toString(), fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0)
                                ],
                              ),
                              // product image
                              Center(child: Image.asset(topRatedItem[index].imageURL,height: 76,)),
                              // product name
                              TextWidget(text: topRatedItem[index].itemName, fontWeight: FontWeight.w500, fontSize: 18, fontFamily: 'Inter', letterSpacing: -0.03,fontColor: Colors.black,),
                              SizedBox(height: 5),
                              // ingredients
                              TextWidget(text: topRatedItem[index].ingredients, fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(155,59, 59, 59),),
                              SizedBox(height: 10),
                              // price and ass button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(text: '& ${topRatedItem[index].price.toString()}', fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'Inter', letterSpacing: -0.03,fontColor: Color.fromARGB(255, 37, 174, 75),),
                                  Container(
                                    width:  MediaQuery.of(context).size.width * 0.06,
                                    height:  MediaQuery.of(context).size.height * 0.03,
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
                TextWidget(text: AppLocalizations.of(context)!.top_recommended, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0),
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
