import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/controller/offer_slider_controller.dart';
import 'package:capstone/model/offer_item_model.dart';
import 'package:capstone/model/recommanded_item_model.dart';
import 'package:capstone/model/top_rated_item_model.dart';
import 'package:capstone/view/screen/product_details_screen.dart';
import 'package:capstone/view/widget/search_box_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllScreen extends StatelessWidget {
  AllScreen({super.key});

  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

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
    List<TopRatedItemModel> topRatedItem = [
      TopRatedItemModel(
        imageURL: 'assets/images/chickenBurger.png',
        price: 20.00,
        ingredients: AppLocalizations.of(context)!.ingredients,
        itemName: AppLocalizations.of(context)!.chicken_burger,
        reatedValue: 3.5,
      ),
      TopRatedItemModel(
        imageURL: 'assets/images/cheeseBurger.png',
        price: 18.00,
        ingredients: AppLocalizations.of(context)!.ingredients,
        itemName: AppLocalizations.of(context)!.cheese_burger,
        reatedValue: 4.5,
      ),
      TopRatedItemModel(
        imageURL: 'assets/images/chickenBurger.png',
        price: 20.00,
        ingredients: AppLocalizations.of(context)!.ingredients,
        itemName: AppLocalizations.of(context)!.chicken_burger,
        reatedValue: 3.5,
      ),
    ];
    List<RecommendedItemModel> recommendedItemModel = [
      RecommendedItemModel(
        price: 8.0,
        imageUrl: 'assets/images/recommended1.png',
      ),
      RecommendedItemModel(
        price: 8.0,
        imageUrl: 'assets/images/recommended2.png',
      ),
      RecommendedItemModel(
        price: 8.0,
        imageUrl: 'assets/images/recommended3.png',
      ),
      RecommendedItemModel(
        price: 8.0,
        imageUrl: 'assets/images/recommended4.png',
      ),
    ];

    return Consumer<OfferSliderController>(
      builder: (context, offerSliderController, child) {
        return Scaffold(
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
            title: SearchBoxWidget(),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Offer Section
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.17,
                  margin: EdgeInsets.only(top: 20),
                  child: CarouselSlider(
                    items: offerItem.map((offer) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: offerItem.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 10, right: 15),
                            child: Row(
                              children: [
                                // offer texts
                                Stack(
                                  children: [
                                    // offer texts
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.445,
                                      height: MediaQuery.of(context).size.height * 0.165,
                                      margin: EdgeInsets.only(top: 1),
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
                                            fontSize: MediaQuery.of(context).size.width * 0.04,
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
                                            fontSize: MediaQuery.of(context).size.width * 0.08,
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
                                      margin: EdgeInsets.only(right: 18, top: 1.5),
                                      child: Image.asset(
                                        'assets/images/offerUpCircle.png',
                                      ),
                                    ),

                                    // down bracket
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height * 0.138,
                                        right: MediaQuery.of(context).size.width * 0.355,
                                      ),
                                      child: Image.asset(
                                        'assets/images/offerDownCircle.png',
                                      ),
                                    ),
                                  ],
                                ),
                                // product image
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.445,
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
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      onPageChanged: (index, reason) {
                        offerSliderController.changeIndex(newIndex: index);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // Offer dots
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: offerSliderController.index,
                    count: offerItem.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      spacing: 16,
                      dotColor: isDarkMode ? Colors.grey[700]! : Colors.black12,
                      activeDotColor: Color.fromARGB(255, 37, 174, 75),
                    ),
                    onDotClicked: (index) {
                      _carouselController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),

                SizedBox(height: 15),
                // Top rated title
                Row(
                  children: [
                    SizedBox(width: 25),
                    TextWidget(
                      text: AppLocalizations.of(context)!.top_rated,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      letterSpacing: 0,
                      fontColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),

                // Top rated item
                Container(
                  height: MediaQuery.of(context).size.height * 0.29,
                  margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedItem.length,
                    itemBuilder: (context, index) {
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
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.38,
                              height: MediaQuery.of(context).size.height * 0.26,
                              decoration: BoxDecoration(
                                color: isDarkMode ? Colors.grey[800]! : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isDarkMode
                                      ? Colors.grey[700]!
                                      : Color.fromARGB(255, 219, 244, 209),
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Star and rate value
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromARGB(255, 255, 159, 6),
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      TextWidget(
                                        text: topRatedItem[index].reatedValue.toString(),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontColor: isDarkMode ? Colors.white : Colors.black,
                                      ),
                                    ],
                                  ),
                                  // product image
                                  Center(
                                    child: Image.asset(
                                      topRatedItem[index].imageURL,
                                      height: 76,
                                    ),
                                  ),
                                  // product name
                                  TextWidget(
                                    text: topRatedItem[index].itemName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                    fontFamily: 'Inter',
                                    letterSpacing: -0.03,
                                    fontColor: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                  SizedBox(height: 5),
                                  // ingredients
                                  TextWidget(
                                    text: topRatedItem[index].ingredients,
                                    fontWeight: FontWeight.w400,
                                    fontSize: MediaQuery.of(context).size.width * 0.025,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0,
                                    fontColor: isDarkMode
                                        ? Colors.grey[400]
                                        : Color.fromARGB(155, 59, 59, 59),
                                  ),
                                  SizedBox(height: 6),
                                  // price and ass button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: '& ${topRatedItem[index].price.toString()}',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        letterSpacing: -0.03,
                                        fontColor: Color.fromARGB(255, 37, 174, 75),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.06,
                                        height: MediaQuery.of(context).size.height * 0.03,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 37, 174, 75),
                                          borderRadius: BorderRadius.circular(20),
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
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(width: 25),
                    TextWidget(
                      text: AppLocalizations.of(context)!.top_recommended,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      letterSpacing: 0,
                      fontColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  margin: EdgeInsets.only(top: 20, bottom: 40),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedItemModel.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              TextButton(
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
                                child: Image.asset(
                                  recommendedItemModel[index].imageUrl,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 0.183,
                                ),
                              ),
                              Container(
                                width: 34,
                                height: 18,
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  left: MediaQuery.of(context).size.width * 0.05,
                                  right: MediaQuery.of(context).size.width * 0.05,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 37, 174, 75),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: '& ${recommendedItemModel[index].price.toString()}',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    letterSpacing: 0,
                                    fontColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}