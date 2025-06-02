

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app/home_page.dart';
import 'package:test_app/education.dart';
import 'package:test_app/maps.dart';
import 'package:test_app/hospital.dart';
import 'package:test_app/hotel.dart';
import 'package:test_app/food.dart';
import 'attraction_card.dart';
import 'help.dart';
import 'package:test_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Temple extends StatefulWidget {
  

  const Temple({super.key, this.message});
  final String? message;

  @override
  State<Temple> createState() =>
      _TempleState();
}

class _TempleState extends State<Temple> {
  bool isLoggedIn = false;
    
  final List<Map<String, dynamic>> attractions= [
    {
      "title": "Mahabhairav Temple",
      "description": "The Mahabhairav Temple, perched atop a hillock in the northern part of Tezpur, Assam, is an ancient shrine dedicated to Lord Shiva. According to legend, it was established by King Bana, a devotee of Shiva, who is said to have introduced the worship of the Shiva Linga in Assam. The original stone temple was destroyed in the 1897 earthquake, and the present concrete structure was rebuilt in the early 20th century by Nag Baba and later developed by Mahadeo Bharati and his devotees. The temple houses one of the largest Shiva Lingams and features intricately carved idols of Lord Ganesha and Lord Hanuman at its entrance. Managed by the Government of Assam, the temple is a significant pilgrimage site, especially during Maha Shivaratri, which is celebrated with great fervor",
      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage2.jpeg?alt=media&token=8f5d41de-374a-4984-a203-ef3689a4c1ea"],
      "latitude": "26.6338",
      "longitude": "92.7912",
    },
    {
      "title": "Haleshwar Temple",
      "description": "Haleshwar Temple, located approximately 10 kilometers north of Tezpur in Assam's Sonitpur district, is one of the region's oldest and most revered Shiva temples. According to local legend, a farmer—referred to as Halowa —discovered a Shiva linga while ploughing his field, leading to the establishment of the temple. The name Haleshwar is derived from this tale. The temple was later reconstructed in 1705 AD by Ahom King Rudra Singha. Situated near the Tezpur-Balipara main road, the temple complex is well-maintained and includes a large pond featuring a prominent Shiva statue accessible via a small bridge. The temple is unique in that it serves as a place of worship for both Vaishnavites and Shaivites, reflecting the region's inclusive spiritual traditions. It attracts numerous devotees, especially during the festival of Mahashivaratri.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage6.jpg?alt=media&token=aa1eaca5-c908-48e3-b0a1-9403f84ad82e"],
     
      "latitude": " 26.708293791375908",
      "longitude": "92.76612588009874",
    },
    {
      "title": "Ganesh Ghat Temple",
      "description": "Ganesh Ghat Temple, located in Tezpur, Assam, is a revered Hindu shrine dedicated to Lord Ganesha. Situated on the banks of the Brahmaputra River in the Mahabhairab area, the temple is notable for its serene ambiance and spiritual significance. The temple houses a red-colored idol of Lord Ganesha, believed to date back to the 9th or 10th century, making it an important historical and religious site in the region. The area surrounding the temple, known as Ganesh Ghat, serves as a peaceful spot for devotees and visitors to engage in prayer and reflection, especially during festivals like Ganesh Chaturthi. The temple's location offers picturesque views of the river, enhancing its appeal as a place of both worship and tranquility",
      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimages7.jpeg?alt=media&token=8aef9b4d-5d04-49c2-ac25-7cfa99a2728b"] ,
    
       "latitude": " 26.617057270345814",
      "longitude": "92.79696803961633",
    },
     {
      "title": "Sri Sri Maa Bhairabi Mandir",
      "description": "Sri Sri Maa Bhairabi Mandir, also known as Bhairabi Temple or Bhairabi Devalaya, is a revered Hindu temple situated on the outskirts of Tezpur in Assam's Sonitpur district. Dedicated to Goddess Bhairabi, an incarnation of Maa Durga, the temple is considered a significant Shakti Peetha and a Siddha Pitha, where devotees seek blessings to fulfill their desires. Perched atop a hill near the Bharali River, the temple offers a serene ambiance and picturesque views, including the Kolia Bhomora Setu across the Brahmaputra River. The temple is accessible via a long staircase leading up from the approach road, and local stalls offer offerings such as ghee lamps, sweets, and fruits for worship. The temple is managed by the government through the office of the District Deputy Commissioner and has familial associations with the Borthakur family of Tezpur. It is renowned for its grand celebrations during Durga Puja and Navratri, attracting numerous devotees and tourists. The temple is open daily from 6:00 AM to 8:00 PM. ",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimages8.jpeg?alt=media&token=a5b6600d-473c-4c13-aff5-e7fe15a5668c"],

      "latitude": " 26.618701601984935",
      "longitude": "92.81900729543818",
    },
    {
      "title": "Da Parbatia Temple",
      "description": "Da Parbatia Temple, located just west of Tezpur in Assam's Sonitpur district, is one of the oldest surviving Hindu temple sites in the region, dating back to the 6th century during the Gupta period. The temple is renowned for its intricately carved stone doorframe, which is considered a masterpiece of early Indian art and architecture. The doorframe features detailed depictions of Hindu deities, including the river goddesses Ganga and Yamuna, standing gracefully with garlands in their hands, reflecting the artistic excellence of the Gupta era. Over time, a brick Shiva temple was constructed over the original structure during the Ahom period, but it was destroyed in the 1897 Assam earthquake, revealing the ancient ruins beneath. Today, the site is protected by the Archaeological Survey of India and stands as a significant testament to Assam's rich cultural and architectural heritage.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimages9.jpeg?alt=media&token=5ed2caf8-113c-4491-b7d4-5a95673686c1"],

        "latitude": " 26.631447917070112",
      "longitude": "92.75758328009606",
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
        builder: (_) => const Temple(
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
                "Temples in Tezpur",
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
            title: const Text("Home", style: TextStyle(color: Colors.black, fontSize: 16)),
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
            title: const Text("Tourist Attraction", style: TextStyle(color: Colors.black, fontSize: 16)),
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
            title: const Text("Educational Institutions", style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Educational()), // Change this from Educational to Temple
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
            title: const Text("Hotel",
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
            leading: const Icon(Icons.food_bank , color: Colors.black),
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
            title: const Text("Help", style: TextStyle(color: Colors.black, fontSize: 16)),
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
