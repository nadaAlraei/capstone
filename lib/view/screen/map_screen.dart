import 'package:capstone/view/screen/checkout_screen.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/bottom_navigation_bar_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  LatLng _currentLocation = LatLng(31.985934703432616, 35.900362288558114);
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    });
    _loadSavedLocation();
  }

  Future<void> _loadSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLat = prefs.getDouble('saved_latitude');
    final savedLng = prefs.getDouble('saved_longitude');
    final savedAddress = prefs.getString('saved_address');

    if (savedLat != null && savedLng != null) {
      setState(() {
        _currentLocation = LatLng(savedLat, savedLng);
      });
    }

    if (savedAddress != null) {
      _locationController.text = savedAddress;
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _saveLocation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('saved_latitude', _currentLocation.latitude);
    await prefs.setDouble('saved_longitude', _currentLocation.longitude);
    await prefs.setString('saved_address', _locationController.text.isNotEmpty
        ? _locationController.text
        : 'Amman, Jordan');

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location saved successfully!')),
    );

  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavigationBarController =
  Provider.of<BottomNavigationBarController>(context, listen: false);
    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            //myLocationEnabled: true,
            markers: {
              Marker(
                markerId: MarkerId("user"),
                position: _currentLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              ),
            },
            initialCameraPosition: CameraPosition(
              target: _currentLocation,
              zoom: 14,
            ),
            onTap: (LatLng location) {
              setState(() {
                _currentLocation = location;
              });
            },
          ),

          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Row(
              children: [IconButton(onPressed: (){
                bottomNavigationBarController.changeWidget(
                  widget: CheckoutScreen(),
                );
                bottomNavigationBarController.changeIndex(index: -1);
              }, icon: Icon(Icons.arrow_back,size: 24,),),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  width: MediaQuery.of(context).size.width * 0.77,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  ),
                  child: TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.find_your_location,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 37, 174, 75)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.55,
              left: 20,
              right: 20,
            ),
            padding: EdgeInsets.all(20),
            width: 343,
            height: 154,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.green),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          _locationController.text.isNotEmpty
                              ? _locationController.text
                              : "Amman, Jordan",
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10),
                  child: TextWidget(
                    text: 'Jl. Soekarno Hatta 15A Malang',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontColor: Colors.grey,

                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      bottomNavigationBarController.changeWidget(
                        widget: CheckoutScreen(),
                      );
                      bottomNavigationBarController.changeIndex(index: -1);
                    },
                    child: Text(AppLocalizations.of(context)!.set_location, style: TextStyle(color: Colors.white)),
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