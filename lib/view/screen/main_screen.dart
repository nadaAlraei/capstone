import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/view/screen/home_screen.dart';
import 'package:capstone/view/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarController>(
      builder: (context, bottomNavigationBarController, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.17,
            title: AppBarWidget(),
          ),

          // Cart button
          floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 219, 244, 209),
                  width: 5,
                ),
                left: BorderSide(
                  color: Color.fromARGB(255, 219, 244, 209),
                  width: 5,
                ),
                right: BorderSide(
                  color: Color.fromARGB(255, 219, 244, 209),
                  width: 5,
                ),
                // Right border
                bottom: BorderSide.none, // Removes bottom border
              ),
            ),
            child: FloatingActionButton(
              onPressed: () {
                bottomNavigationBarController.changeWidget(
                  widget: Text('cart'),
                );
                bottomNavigationBarController.changeIndex(index: 3);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Color.fromARGB(255, 37, 174, 75),
              child: Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Image.asset(
                  'assets/images/cart.png',
                  width: 24,
                  height: 25,
                  color:
                      bottomNavigationBarController.selectIndex == 3
                          ? Color.fromARGB(255, 219, 244, 209)
                          : Colors.white,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Color.fromARGB(255, 219, 244, 209),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Left Tab bar icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Home button
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        bottomNavigationBarController.changeWidget(
                          widget: HomeScreen(),
                        );
                        bottomNavigationBarController.changeIndex(index: 0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home_outlined,
                            color:
                                bottomNavigationBarController.selectIndex == 0
                                    ? Color.fromARGB(255, 37, 174, 75)
                                    : Color.fromARGB(255, 72, 76, 82),
                          ),
                          Text(
                            AppLocalizations.of(context)!.home,
                            style: TextStyle(
                              color:
                                  bottomNavigationBarController.selectIndex == 0
                                      ? Color.fromARGB(255, 37, 174, 75)
                                      : Color.fromARGB(255, 72, 76, 82),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Favorites button
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        bottomNavigationBarController.changeWidget(
                          widget: Text('favorite'),
                        );
                        bottomNavigationBarController.changeIndex(index: 1);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color:
                                bottomNavigationBarController.selectIndex == 1
                                    ? Color.fromARGB(255, 37, 174, 75)
                                    : Color.fromARGB(255, 72, 76, 82),
                          ),
                          Text(
                            AppLocalizations.of(context)!.favorite,
                            style: TextStyle(
                              color:
                                  bottomNavigationBarController.selectIndex == 1
                                      ? Color.fromARGB(255, 37, 174, 75)
                                      : Color.fromARGB(255, 72, 76, 82),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Right Tab bar icons
                Row(
                  children: <Widget>[
                    // History button
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        bottomNavigationBarController.changeWidget(
                          widget: Text('history'),
                        );
                        bottomNavigationBarController.changeIndex(index: 4);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color:
                                bottomNavigationBarController.selectIndex == 4
                                    ? Color.fromARGB(255, 37, 174, 75)
                                    : Color.fromARGB(255, 72, 76, 82),
                          ),
                          Text(
                            AppLocalizations.of(context)!.history,
                            style: TextStyle(
                              color:
                                  bottomNavigationBarController.selectIndex == 4
                                      ? Color.fromARGB(255, 37, 174, 75)
                                      : Color.fromARGB(255, 72, 76, 82),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Profile button
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        bottomNavigationBarController.changeWidget(
                          widget: Text('profile'),
                        );
                        bottomNavigationBarController.changeIndex(index: 5);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_outline_sharp,
                            color:
                                bottomNavigationBarController.selectIndex == 5
                                    ? Color.fromARGB(255, 37, 174, 75)
                                    : Color.fromARGB(255, 72, 76, 82),
                          ),
                          Text(
                            AppLocalizations.of(context)!.profile,
                            style: TextStyle(
                              color:
                                  bottomNavigationBarController.selectIndex == 5
                                      ? Color.fromARGB(255, 37, 174, 75)
                                      : Color.fromARGB(255, 72, 76, 82),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: bottomNavigationBarController.selectWidget,
        );
      },
    );
  }
}
