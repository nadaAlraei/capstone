import 'package:capstone/view/screen/order_details_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../controller/bottom_navigation_bar_controller.dart';
import 'chat_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;
  final LatLng _deliveryLocation = LatLng(31.963158, 35.930359);
  final LatLng _currentLocation = LatLng(31.953158, 35.920359);
  final TextEditingController _locationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('currentLocation'),
                position: _currentLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              ),
              Marker(
                markerId: MarkerId('deliveryLocation'),
                position: _deliveryLocation,
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: SearchBar(),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: EdgeInsets.all(16),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Row(
                      children: [
                        Text('On The Way', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 180,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width* (100/ 430),
                          height: MediaQuery.of(context).size.height* (50/ 932),
                          child: TextButton(onPressed: () {
                            bottomNavigationBarController.changeWidget(
                              widget: OrderDetailsScreen(),
                            );
                            bottomNavigationBarController.changeIndex(index: -1);
                          },
                              child: Text("All Details", style: TextStyle(color: Colors.green),)),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: 'Order Placed',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Inter",
                            letterSpacing: -0.2,
                          fontColor: Colors.green,
                        ),
                        TextWidget(
                          text: 'On The Way',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.green,
                        ),
                        TextWidget(
                          text: 'Delivered',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    LinearProgressIndicator(value: 0.59, backgroundColor: Colors.grey.shade300,color: Colors.green,),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * ( 40 / 430),
                            height: MediaQuery.of(context).size.height * (40 / 932),
                            child: Image.asset('assets/images/photo.jpg')),

                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * ( 110 / 430),
                              height: MediaQuery.of(context).size.height * (28 / 932),
                              child: TextWidget(
                                text: " Your Delivery Hero",
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: 'Intern',
                                letterSpacing: -0.2,
                                fontColor: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 15,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * ( 88 / 430),
                                  height: MediaQuery.of(context).size.height * (20 / 932),
                                  child: TextWidget(
                                    text: "Aleksandr V.",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily: 'Intern',
                                    letterSpacing: -0.2,
                                    fontColor: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * ( 12 / 430),
                                    height: MediaQuery.of(context).size.height * (11.4 / 932),
                                    child: Image.asset('assets/images/star.png')),
                                SizedBox(width: 5,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * ( 20 / 430),
                                  height: MediaQuery.of(context).size.height * (16 / 932),
                                  child: TextWidget(
                                    text: '4.9',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: "Intern",
                                    letterSpacing: -0.2,
                                    fontColor: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Container(
                                width: MediaQuery.of(context).size.width * (50 / 430),
                                height: MediaQuery.of(context).size.height * (60 / 932),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/images/Icon_Phone.png')
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
                                    bottomNavigationBarController.changeIndex(index: -1);
                                  },
                                  icon: Image.asset('assets/images/Icon_Chat.png')
                              ),
                            ),
                          ],
                        ),



                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (263 / 430),
                      height: MediaQuery.of(context).size.height * (25 / 932),
                      child: TextWidget(
                        text: "Your Location",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Inter",
                        letterSpacing: -0.1,
                        fontColor: Colors.grey,
                      ),
                    ),

                    Row(
                      children: [
                        Image.asset('assets/images/ri_map-pin-5-line.png'),
                        SizedBox(width: 5,),
                        TextWidget(
                          text: "123 Al-Madina Street, Abdali, Amman, Jordan",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Inter",
                          letterSpacing: -0.1,
                          fontColor: Colors.black,
                        ),

                      ],
                    ),

                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: "Find your location",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
