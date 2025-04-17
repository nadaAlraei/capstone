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

  String _selectedCategory = '';


  List<Map<String, String>> dishes = [];

  List<String> categories = [];

  String _selectedLocation = '0';
  final Set<String> _selectedDishes = {}; // Track selected dishes

  List<bool> categorySelected = [false, false, false];

  List<String> locationOptions = [];

  List<bool> dishesSelected = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    dishes = [
      {
        "name":AppLocalizations.of(context)!.cheese_burger,
        "category": AppLocalizations.of(context)!.fast_food,
      },
      {
        // "name": AppLocalizations.of(context)!.chocolate_cake,
        "category": AppLocalizations.of(context)!.dessert,
      },
      {
        "name": AppLocalizations.of(context)!.spicy_crab,
        "category": AppLocalizations.of(context)!.sea_food,
      },
      {
        "name": AppLocalizations.of(context)!.miso_glazed,
        "category": AppLocalizations.of(context)!.sea_food,
      },
      {
        "name": AppLocalizations.of(context)!.lobster,
        "category": AppLocalizations.of(context)!.sea_food,
      },
      {
        "name": AppLocalizations.of(context)!.sea_food,
        "category": AppLocalizations.of(context)!.sea_food,
      },
      {
        "name": AppLocalizations.of(context)!.tuna_tartare,
        "category": AppLocalizations.of(context)!.sea_food,
      },
      {
        "name": AppLocalizations.of(context)!.clam_chowder,
        "category": AppLocalizations.of(context)!.sea_food,
      },
    ];

    categories = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.fast_food,
      AppLocalizations.of(context)!.sea_food,
      AppLocalizations.of(context)!.dessert,
    ];

    List<Map<String, String>> getFilteredDishes() {
      if (_selectedCategory == AppLocalizations.of(context)!.all) {
        return dishes;
      } else {
        return dishes
            .where((dish) => dish["category"] == _selectedCategory)
            .toList();
      }
    }

    locationOptions = ["1 ${AppLocalizations.of(context)!.km}", "5 ${AppLocalizations.of(context)!.km}", "10 ${AppLocalizations.of(context)!.km}"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // page title
            TextWidget(
              text: AppLocalizations.of(context)!.filter,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: 'Inter',
              letterSpacing: 0,
            ),
            SizedBox(height: 4),
            TextWidget(
              text: AppLocalizations.of(context)!.price_range,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Inter',
              letterSpacing: 0,
              fontColor: Color.fromARGB(255, 152, 160, 180),
            ),
            SizedBox(height: 15),

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
                      color: Color.fromARGB(255, 234, 250, 235),
                      width: 1,
                    ),
                  ),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.min,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(width: 10),
                // Max
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 38,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 234, 250, 235),
                      width: 1,
                    ),
                  ),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.max,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Slider labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: '&0',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: 'Poppins-Regular',
                  letterSpacing: 0,
                  fontColor: Color.fromARGB(255, 37, 174, 75),
                ),

                TextWidget(
                  text: '&108',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: 'Poppins-Regular',
                  letterSpacing: 0,
                  fontColor: Color.fromARGB(255, 37, 174, 75),
                ),
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

            // Discount
            TextWidget(
              text: AppLocalizations.of(context)!.discount,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Inter',
              letterSpacing: 0,
              fontColor: Color.fromARGB(255, 152, 160, 180),
            ),
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
                      color: Color.fromARGB(255, 234, 250, 235),
                      width: 1,
                    ),
                  ),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.min,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(width: 10),
                // Max
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 38,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 234, 250, 235),
                      width: 1,
                    ),
                  ),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.max,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: '0',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: 'Poppins-Regular',
                  letterSpacing: 0,
                  fontColor: Color.fromARGB(255, 37, 174, 75),
                ),

                TextWidget(
                  text: '50%',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: 'Poppins-Regular',
                  letterSpacing: 0,
                  fontColor: Color.fromARGB(255, 37, 174, 75),
                ),
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

            // Category
            TextWidget(
              text: AppLocalizations.of(context)!.category,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Inter',
              letterSpacing: 0,
              fontColor: Color.fromARGB(255, 152, 160, 180),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children:
                  categories.map((category) {
                    return ChoiceChip(
                      backgroundColor: Color.fromARGB(255, 234, 250, 235),
                      selectedColor: Color.fromARGB(255, 37, 174, 75),
                      side: BorderSide(
                        color: Color.fromARGB(255, 234, 250, 235),
                      ),
                      label: TextWidget(
                        text: category,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        letterSpacing: 0,
                        textAlign: TextAlign.center,
                      ),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 16),

            // Location Selection
            TextWidget(
              text: AppLocalizations.of(context)!.location,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Inter',
              letterSpacing: 0,
              fontColor: Color.fromARGB(255, 152, 160, 180),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children:
              locationOptions.map((location) {
                return ChoiceChip(
                  backgroundColor: Color.fromARGB(255, 234, 250, 235),
                  selectedColor: Color.fromARGB(255, 37, 174, 75),
                  side: BorderSide(
                    color: Color.fromARGB(255, 234, 250, 235),
                  ),
                  label: TextWidget(
                    text: location,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                    textAlign: TextAlign.center,
                  ),
                  selected: _selectedLocation == location,
                  onSelected: (selected) {
                    setState(() {
                      _selectedLocation = location;
                    });
                  },
                );
              }).toList(),
            ),


            SizedBox(height: 16),

            // Dishes Selection
            TextWidget(
              text: AppLocalizations.of(context)!.dish,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Inter',
              letterSpacing: 0,
              fontColor: Color.fromARGB(255, 152, 160, 180),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children:
                  getFilteredDishes().map((dish) {
                    return FilterChip(
                      backgroundColor: Color.fromARGB(255, 234, 250, 235),
                      selectedColor: Color.fromARGB(255, 37, 174, 75),
                      side: BorderSide(
                        color: Color.fromARGB(255, 234, 250, 235),
                      ),
                      label: Text(dish["name"]!),
                      selected: _selectedDishes.contains(dish["name"]!),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedDishes.add(dish["name"]!);
                          } else {
                            _selectedDishes.remove(dish["name"]!);
                          }
                        });
                      },
                    );
                  }).toList(),
            ),

            SizedBox(height: 24),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //
            //   },
            //   child: Container(
            //     width:
            //     MediaQuery.of(
            //       context,
            //     ).size.width *
            //         0.9,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: Color.fromARGB(
            //         255,
            //         37,
            //         174,
            //         75,
            //       ),
            //       borderRadius: BorderRadius.circular(
            //         20,
            //       ),
            //     ),
            //     child: Center(
            //       child: TextWidget(
            //         text:
            //         AppLocalizations.of(
            //           context,
            //         )!.apply_filters,
            //         fontWeight: FontWeight.w500,
            //         fontSize: 14,
            //         fontFamily: 'Inter',
            //         letterSpacing: -0.01,
            //         fontColor: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
