import 'package:capstone/view/screen/home_screen.dart';
import 'package:capstone/view/screen/order_details_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../controller/bottom_navigation_bar_controller.dart';
import 'chat_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;
  final LatLng _deliveryLocation = LatLng(31.963158, 35.930359);
  final LatLng _currentLocation = LatLng(31.953158, 35.920359);
  final TextEditingController _locationController = TextEditingController();
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _setMapPins();
    _setPolyline();
  }

  Future<void> _setMapPins() async {
    _markers.addAll([
      Marker(
        markerId: MarkerId('currentLocation'),
        position: _currentLocation,
        icon: await BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/images/home.png',
        ),
      ),
      Marker(
        markerId: MarkerId('deliveryLocation'),
        position: _deliveryLocation,
        icon: await BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/images/resturant.png',
        ),
      ),
    ]);
  }

  void _setPolyline() {
    _polylines.add(
      Polyline(
        polylineId: PolylineId('route'),
        visible: true,
        points: [_currentLocation, _deliveryLocation],
        color: Colors.green,
        width: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final sheetColor = isDarkMode ? Colors.grey[900] : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryTextColor = isDarkMode ? Colors.grey[400] : Colors.grey;
    final searchBoxColor = isDarkMode ? Colors.grey[800] : Colors.white;

    BottomNavigationBarController bottomNavigationBarController =
    Provider.of<BottomNavigationBarController>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          // Google Map - remains unchanged as requested
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 14.0,
            ),
            markers: _markers,
            polylines: _polylines,
          ),

          // Bottom sheet with dark mode support
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: sheetColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode ? Colors.black54 : Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: AppLocalizations.of(context)!.on_the_way,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontColor: textColor, 
                          fontFamily: 'Inter',
                          letterSpacing: -0.2,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            bottomNavigationBarController.changeWidget(
                              widget: OrderDetailsScreen(),
                            );
                            bottomNavigationBarController.changeIndex(index: -2);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.all_details,
                            style: TextStyle(color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: AppLocalizations.of(context)!.order_placed,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.green,
                        ),
                        TextWidget(
                          text: AppLocalizations.of(context)!.on_the_way,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.green,
                        ),
                        TextWidget(
                          text: AppLocalizations.of(context)!.delivered,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Inter",
                          letterSpacing: -0.2,
                          fontColor: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.59,
                      backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey.shade300,
                      color: Colors.green,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/photo.jpg'),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: AppLocalizations.of(context)!.your_delivery_hero,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              letterSpacing: -0.2,
                              fontColor: secondaryTextColor,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: "Aleksandr V.",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  letterSpacing: -0.2,
                                  fontColor: textColor,
                                ),
                                SizedBox(width: 5),
                                Image.asset(
                                  'assets/images/star.png',
                                  height: 14,
                                  color: isDarkMode ? Colors.white : null,
                                ),
                                SizedBox(width: 3),
                                TextWidget(
                                  text: '4.9',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  fontFamily: "Inter",
                                  letterSpacing: -0.2,
                                  fontColor: secondaryTextColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/Icon_Phone.png',
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            bottomNavigationBarController.changeWidget(
                              widget: ChatScreen(),
                            );
                            bottomNavigationBarController.changeIndex(index: -2);
                          },
                          icon: Image.asset(
                            'assets/images/Icon_Chat.png',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextWidget(
                      text: AppLocalizations.of(context)!.your_location,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: "Inter",
                      letterSpacing: -0.1,
                      fontColor: secondaryTextColor,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/ri_map-pin-5-line.png',
                          color: isDarkMode ? Colors.white : null,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextWidget(
                            text: "123 Al-Madina Street, Abdali, Amman, Jordan",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: "Inter",
                            letterSpacing: -0.1,
                            fontColor: textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          // Search bar at top with dark mode support
          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    bottomNavigationBarController.changeWidget(
                      widget: HomeScreen(),
                    );
                    bottomNavigationBarController.changeIndex(index: 0);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 42,
                  decoration: BoxDecoration(
                    color: searchBoxColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode ? Colors.black54 : Colors.black26,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _locationController,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.find_your_location,
                      hintStyle: TextStyle(color: secondaryTextColor),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 37, 174, 75),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}