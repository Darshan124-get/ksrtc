import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '/screens/bus_detail_page.dart';
import '/screens/search_bus_page.dart';


class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({Key? key}) : super(key: key);

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  final Location _location = Location();
  LocationData? _currentLocation;
  bool _locationFetched = false;

  final LatLng _defaultCenter = LatLng(12.9352, 77.6245); // Koramangala

  final List<LatLng> busLocations = [
    LatLng(12.9370, 77.6265),
    LatLng(12.9325, 77.6200),
    LatLng(12.9340, 77.6300),
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      final locationData = await _location.getLocation();

      setState(() {
        _currentLocation = locationData;
        _locationFetched = true;
      });
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  void _openSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchBusPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    LatLng center = _locationFetched
        ? LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!)
        : _defaultCenter;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyKSRTC'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _openSearchPage,
          )
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          center: center,
          zoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.map_test',
          ),
          MarkerLayer(
            markers: [
              ...busLocations.map((latLng) {
                return Marker(
                  width: 50,
                  height: 50,
                  point: latLng,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusDetailPage(),
                        ),
                      );
                    },
                    child: Image.asset('assets/bus_pin.png'),
                  ),
                );
              }).toList(),
              if (_locationFetched)
                Marker(
                  width: 60,
                  height: 60,
                  point: center,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: Colors.yellow[700],
        child: const Icon(Icons.my_location, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
