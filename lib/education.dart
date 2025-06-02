import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app/home_page.dart';
import 'package:test_app/temple.dart';
import 'package:test_app/hotel.dart';
import 'package:test_app/hospital.dart';
import 'package:test_app/food.dart';
import 'package:test_app/login.dart';
import 'package:test_app/help.dart';
import 'package:test_app/maps.dart';
import 'package:test_app/attraction_card.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Educational extends StatefulWidget {
  

  const Educational({super.key, this.message});
  final String? message;

  @override
  State<Educational> createState() =>
      _EducationalState();
}

class _EducationalState extends State<Educational> {
  bool isLoggedIn = false;
  final List<Map<String, dynamic>> attractions = [
    {
      "title": "Tezpur University",
      "description":
          "Tezpur University is a prestigious central university located in Tezpur, Assam, India. It was established by an Act of Parliament in 1994 with the aim of promoting higher education and research in the northeastern region of India. The university offers undergraduate, postgraduate, and doctoral programs across disciplines such as science, engineering, humanities, social sciences, and management. Known for its beautiful and eco-friendly campus, Tezpur University emphasizes innovation, interdisciplinary learning, and cultural diversity. It has earned national recognition for academic excellence, research output, and its commitment to sustainable development.",
      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479"
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage3.jpg?alt=media&token=5963dbd2-b212-4003-98e7-afc67b152479"
      ],
      
           "latitude": "26.7005",
            "longitude": "92.8248",
    },
    {
      "title": "Darrang College",
      "description":
          "Darrang College, located in Tezpur, Assam, is one of the oldest and most respected educational institutions in the state. Established in July 1945 by the people of Tezpur, the college began with 8 teachers and 112 students. The founding principal was Kamakhya Prasad Tripathy, a veteran freedom fighter and trade union leader. Initially, classes were held at a bungalow owned by Arnaldo Duchi, an Italian who sold the property to the college. Over the years, the college moved locations before settling at its current site in October 1951.",
      "imageUrls":[
        "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage4.jpg?alt=media&token=6926bd27-e024-4364-b34a-7038d4011f58"],
           "latitude": "26.6450",
           "longitude": "92.8012",
    },
    {
      "title": "Tezpur Medical College and Hospital (TMCH)",
      "description":
          "Tezpur Medical College and Hospital (TMCH), established in 2013, is a premier government medical institution located in Tezpur, Assam. Affiliated with the Srimanta Sankaradeva University of Health Sciences and recognized by the National Medical Commission (NMC), TMCH offers undergraduate (MBBS) and postgraduate (MD/MS) programs in various medical disciplines. The college was inaugurated to enhance medical education and healthcare services in the region and admits 125 MBBS students annually. Situated at Tumuki near the AH-15 highway, the campus is well-connected and serves the healthcare needs of a large population across Sonitpur district and nearby areas.",
      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage5.jpg?alt=media&token=3b3334be-19fd-4152-ab44-331adb4e0b1c"],
          "latitude": "26.6538",
          "longitude": "92.7841",
    },
    {
      "title": "Don Bosco Socio-Technical Institute in Tezpur",
      "description":
          "Don Bosco Socio-Technical Institute (DBSTI) in Tezpur, Assam, is a well-known vocational training center focused on empowering youth with practical skills for better job opportunities. Established in 2013, it offers various short-term courses like computer applications, hotel management, tailoring, and primary teacher training. Located in Dekargaon, Tezpur, DBSTI provides quality education and skill development to help students become self-reliant and career-ready.",
      "imageUrls":[ "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimages21.jpeg?alt=media&token=7eda413c-7965-4d41-9c36-272c548f84d8"],
          "latitude": "26.6700",
          "longitude": "92.7890",
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
        builder: (_) => const Educational(
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
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Educational Institutions",
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
              MaterialPageRoute(builder: (context) => TezpurTourismMap()),
            );
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
            title: const Text("Home", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.attractions, color: Colors.black),
            title:
                const Text("Tourist Attraction", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school, color: Colors.black),
            title: const Text("Educational Institutions",
                style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Educational()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.temple_hindu, color: Colors.black),
            title:
                const Text("Religious places", style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Temple()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.hotel, color: Colors.black),
            title: const Text("Hotels", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hotel()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Colors.black),
            title: const Text("Hospital", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hospital()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank, color: Colors.black),
            title: const Text("Food", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Food()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.black),
            title: const Text("Help", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
          ),
          
        ],
      ),
    );
  }
}

