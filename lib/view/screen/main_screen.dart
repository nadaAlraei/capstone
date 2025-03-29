import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Consumer<BottomNavigationBarController>(
      builder: (context, bottomNavigationBarController, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            toolbarHeight: 140,
            title: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 30),
                  child: ListTile(
                    leading: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(30, 79, 175, 90),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/images/ri_map-pin-5-line.png'),
                    ),
                    title: Row(
                      children: [
                        TextWidget(
                          text: 'Current location',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          letterSpacing: 0.16,
                          fontColor: Color.fromARGB(255, 96, 96, 96),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 96, 96, 96),
                          size: 20,
                        ),
                      ],
                    ),
                    subtitle: TextWidget(
                      text: 'Jl. Soekarno Hatta 15A Malang',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontColor: Colors.black,
                    ),
                    trailing: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(150, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.notifications_none, size: 18),
                    ),
                  ),
                ),
                Container(
                  width: 370,
                  height: 55,

                  margin: EdgeInsets.only(bottom: 30),
                  child: InputWidget(
                    textEditingController: search,
                    obscureText: false,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: Color.fromARGB(180, 135, 135, 135),
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list_sharp,
                      size: 18,
                      color: Color.fromARGB(180, 135, 135, 135),
                    ),
                    hintText: 'Search menu, restaurant or etc',
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Container(
            // width: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 219, 244, 209),
                  width: 5,
                ),
                // Only top border
                left: BorderSide(
                  color: Color.fromARGB(255, 219, 244, 209),
                  width: 5,
                ),
                // Left border
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
                          widget: Text('data'),
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
                            'Home',
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
                            'Favorites',
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
                            'History',
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
                            'Profile',
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