import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app/home_page.dart';
import 'package:test_app/education.dart';
import 'package:test_app/maps.dart';
import 'package:test_app/temple.dart';
import 'package:test_app/hotel.dart';
import 'package:test_app/hospital.dart';
import 'package:test_app/login.dart';
import 'attraction_card.dart';
import 'help.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Food extends StatefulWidget {
  

  const Food({super.key, this.message});
  final String? message;

  @override
  State<Food> createState() =>
      _HotelState();
}

class _HotelState extends State<Food> {
  bool isLoggedIn = false;
  final List<Map<String, dynamic>> attractions = [
    {
      "title": "Raj's Elegant Restaurant",
      "description":
          "They offer a welcoming atmosphere where customers can relax and savor delicious dishes prepared with care. Good restaurants focus not only on tasty food but also on excellent service, making every guest feel valued and comfortable. This combination of quality food and great hospitality creates a memorable dining experience for all visitors.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage17.jpeg?alt=media&token=3be64414-e843-467b-a8ee-03c96b3dc7f9"],
      "latitude": "26.649203035247773",
        "longitude": "92.77593358009668", 
    },
    {
      "title": "Lake house cafe",
      "description":
          "They offer a welcoming atmosphere where customers can relax and savor delicious dishes prepared with care. Good restaurants focus not only on tasty food but also on excellent service, making every guest feel valued and comfortable. This combination of quality food and great hospitality creates a memorable dining experience for all visitors.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage18.png?alt=media&token=cea1e17c-3e8b-42ae-a3d0-10f560bb12cf"],
      "latitude": "26.618472418987178",
        "longitude": "92.79131020708178", 
    },
    {
      "title": "Saffron Restaurant Bar and Banquet",
      "description":
          "They offer a welcoming atmosphere where customers can relax and savor delicious dishes prepared with care. Good restaurants focus not only on tasty food but also on excellent service, making every guest feel valued and comfortable. This combination of quality food and great hospitality creates a memorable dining experience for all visitors.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage19.jpg?alt=media&token=fa98df31-8055-4aa1-9597-2d4fe13cef9f"],
      "latitude": "26.622253512957265",
        "longitude": " 92.7964073647532",
    },
    {
      "title": "Bamboho - Feast in Flames",
      "description":
          "They offer a welcoming atmosphere where customers can relax and savor delicious dishes prepared with care. Good restaurants focus not only on tasty food but also on excellent service, making every guest feel valued and comfortable. This combination of quality food and great hospitality creates a memorable dining experience for all visitors.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage20.jpg?alt=media&token=affc7309-2743-4ef5-b6e7-ebe89faf3373"],
       "latitude": "26.633298647627225",
        "longitude": " 92.79811699543869", 
    },
   
  ];

@override
  void initState() {
    super.initState();
    _loadLoginStatus();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.message != null && widget.message!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.message!),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  Future<void> _loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
     final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
       isLoggedIn = loggedIn;
    });
  }

  Future<void> _handleIconPressed() async {
  if (isLoggedIn) {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text('Logout')),
        ],
      ),
    );
    if (shouldLogout ?? false) {
      await _logout();
    }
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }
}

  
  
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Food(
          message: 'You have successfully logout',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Feather.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          "Tezpur, Assam",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      actions: [
  IconButton(
    icon: Icon(isLoggedIn ? Icons.logout : Icons.person),
    onPressed: _handleIconPressed,
    
  ),
  ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Restaurants in Tezpur",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                   itemCount: attractions.length,
                  itemBuilder: (context, index) {
                    final attraction = attractions[index];
                    return AttractionCard(
                       title: attraction["title"]?? "Default Title",
                      description: attraction["description"]?? "Default Title",
                      imageUrls: List<String>.from(attraction["imageUrls"] ?? []), 
                      latitude: double.parse(attraction["latitude"]?? "Default Title"), // ✅
                      longitude: double.parse(attraction["longitude"]?? "Default Title"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
  if (index == 1) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TezpurTourismMap()),);
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }
},
        items: const [
          BottomNavigationBarItem(icon: Icon(Feather.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Feather.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Feather.user), label: "User"),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
            leading: const Icon(Icons.home, color: Colors.black),
            title: const Text("Home",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attractions, color: Colors.black),
            title: const Text("Tourist Attraction",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school, color: Colors.black),
            title: const Text("Educational Institutions",
                style: TextStyle(color: Colors.black, fontSize: 16)),
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
            title: const Text("Religious places",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Temple()),
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
            leading: const Icon(Icons.help, color: Colors.black),
            title: const Text("Help",
                style: TextStyle(color: Colors.black, fontSize: 16)),
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
