import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app/education.dart';
import 'package:test_app/maps.dart';
import 'package:test_app/temple.dart';
import 'package:test_app/attraction_card.dart';
import 'package:test_app/help.dart';
import 'package:test_app/hotel.dart';
import 'package:test_app/hospital.dart';
import 'package:test_app/food.dart';
import 'package:test_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TouristAttractionsScreen extends StatefulWidget {
  

  const TouristAttractionsScreen({super.key, this.message});
  final String? message;

  @override
  State<TouristAttractionsScreen> createState() =>
      _TouristAttractionsScreenState();
}

class _TouristAttractionsScreenState extends State<TouristAttractionsScreen> {
  bool isLoggedIn = false;

  final List<Map<String, dynamic>> attractions = [
   {
      "title": "Agnigarh",
      "description": "Agnigarh is a historic hillock in Tezpur, Assam, known for its deep roots in Hindu mythology. The name means fort of fire, as it was believed to be surrounded by flames to keep Princess Usha, daughter of the demon king Banasura, away from her lover Aniruddha, the grandson of Lord Krishna. Today, Agnigarh is a popular tourist attraction featuring scenic views, lush gardens, and sculptures that depict the legendary love story. It stands as a symbol of romance, mythology, and Tezpurs rich cultural heritage.",

      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage.jpeg?alt=media&token=96115cf2-7c35-4375-828e-c43bfdc076ac",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F01.jpeg?alt=media&token=7ebce943-148f-4661-9f1b-32f5333df156",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F02.jpeg?alt=media&token=9bac1c98-3b90-4a75-99d8-96f540c9c9a0",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F03.jpeg?alt=media&token=3bfbdc0a-b459-4715-9f49-6bd5fbd10edc",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F05.jpeg?alt=media&token=49ef31d7-b8b1-4bf9-a68d-7eaf2ae13032",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F06.jpeg?alt=media&token=fab09e09-f5f0-47c5-8299-17a2d9c3fb6f"],
      
      "latitude": "26.6172",
      "longitude": "92.8012",
    },
    {
      "title": "Bamuni Hill",
      "description": "Bamuni Hill, located near Tezpur in Assam, is an important archaeological site known for its ancient temple ruins from the 9th and 10th centuries. The site features beautifully carved stone sculptures and remnants of a Panchayatana-style temple complex, reflecting the influence of the Gupta period. Believed to have been built during the reign of the Salastambha dynasty, Bamuni Hill showcases the artistic and architectural brilliance of early Assam. Besides its historical value, the hill offers scenic views and a peaceful atmosphere, making it a popular spot for tourists and history lovers alike.",
      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage1.jpeg?alt=media&token=2e5ff378-59c9-4604-97e0-86312e2e5fbe",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F07.jpeg?alt=media&token=d26b878b-460c-4926-bda7-afa1da3f8bc2",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F08.jpeg?alt=media&token=d8415fac-fc0c-461f-ad4e-c73f05fcf211",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F09.jpeg?alt=media&token=babcd458-6170-46d5-a25d-bdbe09674a79",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F10.jpeg?alt=media&token=04b91ece-67c6-4775-bf89-263b6771c5e6",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F11.jpg?alt=media&token=183fcf97-cdb1-4c8f-acca-3381c277df3c"] ,
      
       "latitude": "26.61683", 
        "longitude": "92.81591",
      
    },
    {
      "title": "Mahabhairav Temple",
      "description": "The Mahabhairav Temple, perched atop a hillock in the northern part of Tezpur, Assam, is an ancient shrine dedicated to Lord Shiva. According to legend, it was established by King Bana, a devotee of Shiva, who is said to have introduced the worship of the Shiva Linga in Assam. The original stone temple was destroyed in the 1897 earthquake, and the present concrete structure was rebuilt in the early 20th century by Nag Baba and later developed by Mahadeo Bharati and his devotees. The temple houses one of the largest Shiva Lingams and features intricately carved idols of Lord Ganesha and Lord Hanuman at its entrance. Managed by the Government of Assam, the temple is a significant pilgrimage site, especially during Maha Shivaratri, which is celebrated with great fervor",
      "imageUrls":["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage2.-jpeg?alt=media&token=8f5d41de-374a-4984-a203-ef3689a4c1ea",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F12.jpg?alt=media&token=caba9118-6d17-4e1a-88b6-5fefea909e34",
      "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F13.jpg?alt=media&token=a1685a0d-a8f6-477b-a9a9-2f382456435a","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F14.jpeg?alt=media&token=fbc9adef-0ad0-40ca-851f-aebf4900a6dc","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F15.jpeg?alt=media&token=1d8039ca-5bae-4c1f-8a58-45e01cb2df88","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F16.jpeg?alt=media&token=b09f5efc-d686-4cff-b29e-042c739031ba"] ,
       
       "latitude": "26.634389422508626", 
       "longitude": "92.7963591819456",
    },
     {
      "title": "Koliabhomora Bridge",
      "description": "The Koliabhomora Bridge, located near Tezpur in Assam, is one of the key infrastructural landmarks in northeastern India. Spanning the majestic Brahmaputra River, this bridge connects Tezpur in Sonitpur district on the northern bank with Jakhalabandha in Nagaon district on the southern bank. It is named after Kalia Bhomora Phukan, a distinguished general of the Ahom kingdom, who had planned to construct a bridge at the same location in the 18th century, though the project was not completed during his time.Constructed by Hindustan Construction Company (HCC) and inaugurated in 1987, the Koliabhomora Bridge stretches approximately 3.05 kilometers and serves as a vital link on National Highway 715 (formerly NH 37A). It has significantly boosted economic activity and enhanced transportation in the region, reducing travel time and improving access between Upper and Lower Assam.Due to increasing traffic over the years, a second parallel bridge was later built to ease congestion and ensure uninterrupted travel. The original and new bridges together now accommodate the rising demands of vehicular movement, making them crucial for both civilian transportation and military logistics in the strategically important northeastern corridor.The bridge not only stands as a marvel of engineering but also as a symbol of historical vision and modern development in Assam.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage22.jpg?alt=media&token=bd2f7d51-2431-470c-8ada-223afa8c7732","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F17.jpg?alt=media&token=097843fc-c763-42b1-a79f-0d17932a8834","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F18.jpg?alt=media&token=ba4312b6-b4b6-4109-b3c5-3bd8c8f70ae2","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F19.jpg?alt=media&token=ee74eea1-89ac-4ff7-9553-b5d9b3014e96","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F20.jpg?alt=media&token=134cd062-a031-4b6a-8b4b-c83feebd45a6","https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2F21.jpeg?alt=media&token=2177746b-6df6-4587-a257-4e8444e1ac5b"],
       
       "latitude": "26.60023608192136", 
       "longitude": "92.85784039728703",
    },
     {
      "title": "Kanaklata Memorial Park",
      "description": "Kanaklata Memorial Park, also known as Kanaklata Park or Rock Garden, is a peaceful hilltop park located in Tezpur, Assam. It is named in honor of Kanaklata Barua, a brave young freedom fighter who sacrificed her life during the Quit India Movement in 1942. The park features a statue of Kanaklata and serves as a tribute to her patriotism and courage. Nestled atop Dhenukhana Hill, the park offers stunning views of the Brahmaputra River and the surrounding town. With its natural rock formations, lush greenery, and serene ambiance, it is a popular spot for relaxation, photography, and enjoying the scenic beauty of Tezpur.",
      "imageUrls":[ "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage23.jpg?alt=media&token=376ad036-c83f-40f3-ab38-accf413c7c26"],
       
       "latitude": "26.61805956894557",
        "longitude": "92.78013681105307", 
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
        builder: (_) => const TouristAttractionsScreen(
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
          builder: (context) => IconButton(
            icon: const Icon(Feather.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
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
      drawer: AppDrawer(parentContext: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tourist Attractions ",
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
              MaterialPageRoute(builder: (_) => TezpurTourismMap()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LogIn()),
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

// Drawer stays the same as before
class AppDrawer extends StatelessWidget {
  final BuildContext parentContext;

  const AppDrawer({Key? key, required this.parentContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.menu, size: 40, color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.black),
            title: const Text("Home",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TouristAttractionsScreen()),
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
                MaterialPageRoute(
                    builder: (context) => const TouristAttractionsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.school, color: Colors.black),
            title: const Text("Educational Institutions",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Educational()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.temple_hindu, color: Colors.black),
            title: const Text("Religious places",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Temple()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.hotel, color: Colors.black),
            title: const Text("Hotels",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hotel()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Colors.black),
            title: const Text("Hospital",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hospital()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank, color: Colors.black),
            title: const Text("Food",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Food()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.black),
            title: const Text("Help",
                style: TextStyle(color: Colors.black, fontSize: 16)),
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
