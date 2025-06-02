import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app/education.dart';
import 'package:test_app/temple.dart';
import 'package:test_app/help.dart';
import 'package:test_app/home_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:test_app/hotel.dart';
import 'package:test_app/hospital.dart';
import 'package:test_app/food.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class TezpurTourismMap extends StatefulWidget {
  final LatLng? preselectedDestination;
  final String? preselectedName;

  const TezpurTourismMap({this.preselectedDestination, this.preselectedName});

  @override
  _TezpurTourismMapState createState() => _TezpurTourismMapState();
}

class _TezpurTourismMapState extends State<TezpurTourismMap> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(26.651218, 92.783813);
  LatLng? _selectedDestination;
  String? _selectedLocationName;
  String? _distance;

  final List<Marker> _markers = [];
  Set<Polyline> _polylines = {};
  List<LatLng> _polylineCoordinates = [];
  Marker? _liveLocationMarker;

  bool _isNavigating = false;
  StreamSubscription<Position>? _positionStream;

  @override
  void initState() {
    super.initState();
    _initializeMarkers();

    if (widget.preselectedDestination != null) {
      _selectedDestination = widget.preselectedDestination;
      _selectedLocationName = widget.preselectedName;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _launchDirections(_selectedDestination!);
      });
    }
  }

  void _initializeMarkers() {
    _addMarker("Agnigarh", LatLng(26.6172, 92.8012));
    _addMarker("Mahabhairav Temple", LatLng(26.6338, 92.7912));
    _addMarker("Bamuni Hills", LatLng(26.61683, 92.81591));
    _addMarker("Tezpur University", LatLng(26.7005, 92.8248));
    _addMarker("Koliabhomora Bridge", LatLng(26.60023608192136, 92.85784039728703));
    _addMarker("Kanaklata Memorial Park", LatLng(26.61805956894557, 92.78013681105307));
    _addMarker("Hotel tezpur city", LatLng(26.625812016197678, 92.79688940708205));
    _addMarker("hotel friends palace tezpur", LatLng(26.64294572136658, 92.79838481078157));
    _addMarker("Hotel BaruahTower", LatLng(26.68754419460662, 92.76448110893365));
    _addMarker("Tezpur Medical College and Hospital (TMCH)", LatLng(26.7005, 92.8248));
    _addMarker("Dorika Hospital", LatLng(26.652275554177823, 92.79051139543937));
    _addMarker("TIMeS Hospital", LatLng(26.650831812283666, 92.77441335311059));
    _addMarker("Baptist Christian Hospital", LatLng(26.65279418658663, 92.7725660359186));
    _addMarker("Raj's Elegant Restaurant", LatLng(26.649203035247773, 92.77593358009668));
    _addMarker("Lake house cafe", LatLng(26.618472418987178, 92.79131020708178));
    _addMarker("Saffron Restaurant Bar and Banquet", LatLng(26.622253512957265, 92.7964073647532));
    _addMarker("Bamboho - Feast in Flames", LatLng(26.633298647627225, 92.79811699543869));
    _addMarker("Don Bosco Socio-Technical Institute in Tezpur", LatLng(26.6700, 92.7890));
    _addMarker("Haleshwar Temple", LatLng(26.708293791375908,92.76612588009874 ));
    _addMarker("Ganesh Ghat Temple", LatLng(26.617057270345814, 92.79696803961633));
    _addMarker("Sri Sri Maa Bhairabi Mandir", LatLng(26.618701601984935, 92.81900729543818));
    _addMarker("Da Parbatia Temple", LatLng( 26.631447917070112, 92.75758328009606));
  }

  void _addMarker(String title, LatLng position) {
    _markers.add(
      Marker(
        markerId: MarkerId(title),
        position: position,
        infoWindow: InfoWindow(title: title),
        onTap: () {
          setState(() {
            _selectedDestination = position;
            _selectedLocationName = title;
          });
          _launchDirections(position);
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _launchDirections(LatLng destination) async {
    try {
      final position = await _determinePosition();
      final origin = '${position.latitude},${position.longitude}';
      final dest = '${destination.latitude},${destination.longitude}';
      final apiKey = "AIzaSyDWE08Pxm7X79jd6aT-XxFWwb757aYIjkc";

      final url =
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$dest&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (data['status'] != 'OK') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Directions API Error: ${data['status']}")),
        );
        return;
      }

      final polyline = data['routes'][0]['overview_polyline']['points'];
      final polylinePoints = PolylinePoints().decodePolyline(polyline);

      _polylineCoordinates.clear();
      for (var point in polylinePoints) {
        _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      final distance = data['routes'][0]['legs'][0]['distance']['text'];

      setState(() {
        _distance = distance;
        _polylines.clear();
        _polylines.add(Polyline(
          polylineId: PolylineId("route"),
          points: _polylineCoordinates,
          color: Colors.blue,
          width: 5,
        ));
      });

      mapController.animateCamera(CameraUpdate.newLatLngBounds(
        _boundsFromLatLngList(_polylineCoordinates),
        50,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  Future<void> _startNavigation() async {
    if (_selectedDestination == null) return;

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position position) {
      final currentLatLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _liveLocationMarker = Marker(
          markerId: MarkerId("live"),
          position: currentLatLng,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: InfoWindow(title: "You are here"),
        );
        _markers.removeWhere((m) => m.markerId == MarkerId("live"));
        _markers.add(_liveLocationMarker!);
      });

      mapController.animateCamera(CameraUpdate.newLatLng(currentLatLng));

      double distance = Geolocator.distanceBetween(
        currentLatLng.latitude,
        currentLatLng.longitude,
        _selectedDestination!.latitude,
        _selectedDestination!.longitude,
      );

      if (distance < 30.0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You have reached your destination!")),
        );
        _stopNavigation();
      }
    });

    setState(() => _isNavigating = true);
  }

  void _stopNavigation() {
    _positionStream?.cancel();
    _positionStream = null;
    setState(() {
      _isNavigating = false;
      _markers.removeWhere((m) => m.markerId == MarkerId("live"));
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied.");
    }

    return await Geolocator.getCurrentPosition();
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double x0 = list.first.latitude, x1 = list.first.latitude;
    double y0 = list.first.longitude, y1 = list.first.longitude;

    for (LatLng latLng in list) {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(x0, y0),
      northeast: LatLng(x1, y1),
    );
  }

  void _onBottomNavTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TouristAttractionsScreen()),
      );
    }
  }

  Widget _luxuryItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () async {
        if (label == "Direction") {
          if (_selectedDestination != null) {
            await _launchDirections(_selectedDestination!);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please select a destination.")),
            );
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tezpur Map"),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            markers: Set.from(_markers),
            polylines: _polylines,
            myLocationEnabled: true,
          ),
          if (_distance != null)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 4),
                  ],
                ),
                child: Text("Distance: $_distance"),
              ),
            ),
        ],
      ),
      drawer: AppDrawer(extraItems: [
        _luxuryItem(Icons.directions, "Direction"),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Feather.user), label: "User"),
        ],
      ),
      bottomSheet: _selectedDestination == null
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Destination: $_selectedLocationName",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _launchDirections(_selectedDestination!),
                          icon: const Icon(Icons.directions),
                          label: const Text("Directions"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _isNavigating ? _stopNavigation : _startNavigation,
                          icon: Icon(_isNavigating ? Icons.stop : Icons.navigation),
                          label: Text(_isNavigating ? "Stop" : "Navigate"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isNavigating ? Colors.red : Colors.green,
                            foregroundColor: Colors.white,
                          ),
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

class AppDrawer extends StatelessWidget {
  final List<Widget>? extraItems;

  const AppDrawer({this.extraItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text(
              "Tezpur Tourism",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attractions),
            title: const Text("Tourist Attraction"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Educational Institutions"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Educational()),
              );
            },
          ),
         ListTile(
            leading: const Icon(Icons.temple_hindu, color: Colors.black),
            title: const Text("Religious places", style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Temple()), // Change this from Educational to Temple
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.hotel, color: Colors.black),
            title: const Text("Hotels",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Hotel()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Colors.black),
            title: const Text("Hospital",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Hospital()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank, color: Colors.black),
            title: const Text("food",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Food()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Help"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              );
            },
          ),
         
        ],
      ),
    );
  }
}
