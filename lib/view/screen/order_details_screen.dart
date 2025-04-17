import 'package:capstone/view/screen/chat_screen.dart';
import 'package:capstone/view/widget/timeline_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import '../widget/text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreen();
}

class _OrderDetailsScreen extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22, right: 22, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: AppLocalizations.of(context)!.order_details,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Inter',
                letterSpacing: -0.2,
                fontColor: isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Image.asset(
                    'assets/images/takeaway.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: AppLocalizations.of(context)!.order_id,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: isDarkMode ? Colors.white : Colors.black,
                      ),
                      TextWidget(
                        text: "#6579-6432",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: isDarkMode ? Colors.grey[400] : Colors.grey,
                      ),
                      TextWidget(
                        text: "25 ${AppLocalizations.of(context)!.m}",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.2,
                        fontColor: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              TimelineTileWidget(
                isFirst: true,
                isLast: false,
                icon: Icons.check,
                text: "  ${AppLocalizations.of(context)!.order_received}",
                isCompleted: true,
                isDarkMode: isDarkMode,
              ),

              TimelineTileWidget(
                isFirst: true,
                isLast: false,
                icon: Icons.store,
                text: "  ${AppLocalizations.of(context)!.cooking_your_order}",
                isCompleted: true,
                isDarkMode: isDarkMode,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (335 / 430),
                height: MediaQuery.of(context).size.height * (80 / 932),
                child: TimelineTileWidget(
                  isFirst: true,
                  isLast: false,
                  icon: Icons.person,
                  text: "  ${AppLocalizations.of(context)!.picking_up_order}",
                  isCompleted: true,
                  isDarkMode: isDarkMode,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * (335 / 430),
                height: MediaQuery.of(context).size.height * (80 / 932),
                child: TimelineTileWidget(
                  isFirst: true,
                  isLast: true,
                  icon: Icons.home,
                  text: "  ${AppLocalizations.of(context)!.cooking_your_order}",
                  isCompleted: false,
                  isDarkMode: isDarkMode,
                ),
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (40 / 430),
                    height: MediaQuery.of(context).size.height * (40 / 932),
                    child: Image.asset('assets/images/photo.jpg'),
                  ),

                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (110 / 430),
                        height: MediaQuery.of(context).size.height * (28 / 932),
                        child: TextWidget(
                          text:
                          AppLocalizations.of(context)!.your_delivery_hero,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Intern',
                          letterSpacing: -0.2,
                          fontColor: isDarkMode ? Colors.grey[400] : Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          SizedBox(
                            width:
                            MediaQuery.of(context).size.width * (88 / 430),
                            height:
                            MediaQuery.of(context).size.height * (20 / 932),
                            child: TextWidget(
                              text: "Aleksandr V.",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: 'Intern',
                              letterSpacing: -0.2,
                              fontColor: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(
                            width:
                            MediaQuery.of(context).size.width * (12 / 430),
                            height:
                            MediaQuery.of(context).size.height *
                                (11.4 / 932),
                            child: Image.asset(
                              'assets/images/star.png',
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width:
                            MediaQuery.of(context).size.width * (20 / 430),
                            height:
                            MediaQuery.of(context).size.height * (16 / 932),
                            child: TextWidget(
                              text: '4.9',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              fontFamily: "Intern",
                              letterSpacing: -0.2,
                              fontColor: isDarkMode ? Colors.grey[400] : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Container(
                          width: MediaQuery.of(context).size.width * (50 / 430),
                          height:
                          MediaQuery.of(context).size.height * (60 / 932),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/Icon_Phone.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * (50 / 430),
                        height: MediaQuery.of(context).size.height * (60 / 932),
                        child: IconButton(
                          onPressed: () {
                            bottomNavigationBarController.changeWidget(
                              widget: ChatScreen(),
                            );
                            bottomNavigationBarController.changeIndex(
                              index: -1,
                            );
                          },
                          icon: Image.asset(
                            'assets/images/Icon_Chat.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * (263 / 430),
                height: MediaQuery.of(context).size.height * (34 / 932),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.your_location,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: "Inter",
                  letterSpacing: -0.1,
                  fontColor: isDarkMode ? Colors.grey[400] : Colors.grey,
                ),
              ),

              Row(
                children: [
                  Image.asset(
                    'assets/images/ri_map-pin-5-line.png',
                  ),
                  SizedBox(width: 5),
                  TextWidget(
                    text: "123 Al-Madina Street, Abdali, Amman, Jordan",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: "Inter",
                    letterSpacing: -0.1,
                    fontColor: isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * (48 / 932),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.green[800] : Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.of(context)!.live_track,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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