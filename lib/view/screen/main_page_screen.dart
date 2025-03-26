import 'package:capstone/view/screen/home_screen.dart';
import 'package:capstone/view/screen/onboardring3_screen.dart';
import 'package:capstone/view/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  Widget bottomBarSelectedPage = HomeScreen();
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        titleSpacing: 3,
        title: AppBarWidget(),
      ),
      body: bottomBarSelectedPage,
      // Diet button
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 37, 174, 75),

          child: Icon(
            Icons.shopping_cart_outlined,
            color: selectIndex == 3 ? Colors.white : Colors.white,
          ),
          onPressed: () {

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(50, 79, 175, 90),
        shape: CircularNotchedRectangle(),
        notchMargin: -10,
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
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        // color: bottomNavigationBarController.selectIndex == 0
                        //     ? Color.fromARGB(255, 244, 117, 81)
                        //     : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          // color:
                          // bottomNavigationBarController.selectIndex == 0
                          //     ? Color.fromARGB(255, 244, 117, 81)
                          //     : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Behaviors button
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        // color: bottomNavigationBarController.selectIndex == 0
                        //     ? Color.fromARGB(255, 244, 117, 81)
                        //     : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          // color:
                          // bottomNavigationBarController.selectIndex == 0
                          //     ? Color.fromARGB(255, 244, 117, 81)
                          //     : Colors.grey,
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
                // User Info button
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        // color: bottomNavigationBarController.selectIndex == 0
                        //     ? Color.fromARGB(255, 244, 117, 81)
                        //     : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          // color:
                          // bottomNavigationBarController.selectIndex == 0
                          //     ? Color.fromARGB(255, 244, 117, 81)
                          //     : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // More button
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        // color: bottomNavigationBarController.selectIndex == 0
                        //     ? Color.fromARGB(255, 244, 117, 81)
                        //     : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          // color:
                          // bottomNavigationBarController.selectIndex == 0
                          //     ? Color.fromARGB(255, 244, 117, 81)
                          //     : Colors.grey,
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
    );
  }
}
