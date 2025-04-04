import 'package:capstone/view/screen/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    // Navigate to checkout
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
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
          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: _saveLocation,
                      child: Text("Set Location", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}