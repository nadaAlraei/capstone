import 'package:capstone/view/widget/app_bar_widget.dart';
import 'package:capstone/view/widget/counter_widget.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/search_box_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  TextEditingController search = TextEditingController();
  double _currentSliderPrimaryValue = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: SearchBoxWidget(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/productDetailsImage.png'),
              SizedBox(height: 20),
              TextWidget(text: AppLocalizations.of(context)!.product_name, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0,),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.star,color: Color.fromARGB(255,255, 193, 7),size: 14,),
                  Icon(Icons.star,color: Color.fromARGB(255,255, 193, 7),size: 14,),
                  Icon(Icons.star,color: Color.fromARGB(255,255, 193, 7),size: 14,),
                  Icon(Icons.star,color: Color.fromARGB(255,255, 193, 7),size: 14,),
                  Icon(Icons.star_half,color: Color.fromARGB(255,255, 193, 7),size: 14,),
                  SizedBox(width: 5),
                  TextWidget(text: '4.5 (89 reviews)', fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,134, 136, 137),),
        
                ],
              ),
              Row(
                children: [
                  TextWidget(text: '&7.99', fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,0, 153, 68),),
                  SizedBox(width: 5),
                  TextWidget(text: '&9.5', fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,134, 136, 137),textDecoration: TextDecoration.lineThrough,),
        
                ],
              ),
              SizedBox(height: 10),
              TextWidget(text: AppLocalizations.of(context)!.product_des, fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,134, 136, 137),),
              SizedBox(height: 20),
              // Slider & quantity
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Slider
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: AppLocalizations.of(context)!.spicy, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,134, 136, 137),),
                        SizedBox(height: 10),
                        Slider(
                          value: _currentSliderPrimaryValue,
                          activeColor: Color.fromARGB(255,239, 42, 57),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderPrimaryValue = value;
                            });
        
                          },
                        padding: EdgeInsets.zero,
                        ),
                        SizedBox(height: 5),
                        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: AppLocalizations.of(context)!.mild, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular', letterSpacing: 0,fontColor: Color.fromARGB(255, 37, 174, 75),),
        
                            TextWidget(text: AppLocalizations.of(context)!.hot, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular', letterSpacing: 0,fontColor: Color.fromARGB(255,239, 42, 57),),
        
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              // Quantity
              SizedBox(
        
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: AppLocalizations.of(context)!.quantity, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,134, 136, 137),),
                          SizedBox(height: 10),
                         CounterWidget(),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 18),
              // Add to cart
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 174, 75),
                  borderRadius: BorderRadius.circular(10),
                ),
        
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    AppLocalizations.of(context)!.add_to_cart,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
