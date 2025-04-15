
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _currentSliderPrimaryValue = 0.2;
  double _currentSliderPrimaryValue2 = 0.5;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // page title
                TextWidget(text: AppLocalizations.of(context)!.filter, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Inter', letterSpacing: 0),
                SizedBox(height: 4),
                TextWidget(text: AppLocalizations.of(context)!.price_range, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,152, 160, 180),),
                SizedBox(height: 15),
                // Min & Max
                Row(
                  children: [
                    // Min
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 38,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.min, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0),
                    ),
                    SizedBox(width: 10),
                    // Max
                    Container(
                      width: MediaQuery.of(context).size .width *0.4,
                      height: 38,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.max, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Slider labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: '&0', fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular', letterSpacing: 0,fontColor: Color.fromARGB(255, 37, 174, 75),),

                    TextWidget(text: '&108', fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular', letterSpacing: 0,fontColor: Color.fromARGB(255, 37, 174, 75),),

                  ],
                ),
                Slider(
                  value: _currentSliderPrimaryValue,
                  activeColor: Color.fromARGB(255, 37, 174, 75),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderPrimaryValue = value;
                    });

                  },
                  padding: EdgeInsets.zero,
                ),
                SizedBox(height: 20),
                TextWidget(text: AppLocalizations.of(context)!.discount, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,152, 160, 180),),
                SizedBox(height: 15),
                // Min & Max
                Row(
                  children: [
                    // Min
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 38,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.min, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0),
                    ),
                    SizedBox(width: 10),
                    // Max
                    Container(
                      width: MediaQuery.of(context).size .width *0.4,
                      height: 38,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.max, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: '0', fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular', letterSpacing: 0,fontColor: Color.fromARGB(255, 37, 174, 75),),

                    TextWidget(text: '50%', fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Poppins-Regular', letterSpacing: 0,fontColor: Color.fromARGB(255, 37, 174, 75),),

                  ],
                ),
                Slider(
                  value: _currentSliderPrimaryValue2,
                  activeColor: Color.fromARGB(255, 37, 174, 75),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderPrimaryValue2 = value;
                    });

                  },
                  padding: EdgeInsets.zero,
                ),
                SizedBox(height: 20),
                TextWidget(text: AppLocalizations.of(context)!.category, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,152, 160, 180),),
                SizedBox(height: 15),
                // Category
                Row(
                  children: [
                    // Category 1
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.fast_food, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                    SizedBox(width: 10),
                    // Category 2
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255,234, 250, 235),
                          width: 1,
                        ),
                        color: Color.fromARGB(255,37, 174, 75),
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.sea_food, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,fontColor: Colors.white,),
                    ),
                    SizedBox(width: 10),
                    // Category 3
                    Container(
                      width: MediaQuery.of(context).size.width * 0.21,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.dessert, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextWidget(text: AppLocalizations.of(context)!.location, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,152, 160, 180),),
                SizedBox(height: 15),
                // Location category
                Row(
                  children: [
                    // category 1
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: '1 ${AppLocalizations.of(context)!.km}', fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                    SizedBox(width: 10),
                    // category 2
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255,234, 250, 235),
                          width: 1,
                        ),
                        color: Color.fromARGB(255,37, 174, 75),
                      ),
                      child: TextWidget(text: '5 ${AppLocalizations.of(context)!.km}', fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,fontColor: Colors.white,),
                    ),
                    SizedBox(width: 10),
                    // category 3
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: '10 ${AppLocalizations.of(context)!.km}', fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextWidget(text: AppLocalizations.of(context)!.dish, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Inter', letterSpacing: 0,fontColor: Color.fromARGB(255,152, 160, 180),),
                SizedBox(height: 15),
                // Category group 1
                Row(
                  children: [
                    // dish 1
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.tuna_tartare, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                    SizedBox(width: 10),
                    // dish 2
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255,234, 250, 235),
                          width: 1,
                        ),
                        color: Color.fromARGB(255,37, 174, 75),
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.spicy_crab, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,fontColor: Colors.white,),
                    ),
                    SizedBox(width: 10),
                    // dish 3
                    Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.seafood_paella, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // Category group 2
                Row(
                  children: [
                    // dish 1
                    Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.clam_chowder, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                    SizedBox(width: 5),
                    // dish 2
                    Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255,234, 250, 235),
                          width: 1,
                        ),
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.miso_glazed, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                    SizedBox(width: 5),
                    // dish 3
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 28,
                      padding: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255,234, 250, 235),
                            width: 1,
                          )
                      ),
                      child: TextWidget(text: AppLocalizations.of(context)!.lobster, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: 'Inter', letterSpacing: 0,textAlign: TextAlign.center,),
                    ),
                  ],
                ),

              ],
            ),
          )
      ),
    );
  }
}