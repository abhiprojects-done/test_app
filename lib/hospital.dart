// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app/home_page.dart';
import 'package:test_app/education.dart';
import 'package:test_app/maps.dart';
import 'package:test_app/temple.dart';
import 'package:test_app/hotel.dart';
import 'package:test_app/login.dart';
import 'package:test_app/food.dart';
import 'attraction_card.dart';
import 'help.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hospital extends StatefulWidget {
  

  const Hospital({super.key, this.message});
  final String? message;

  @override
  State<Hospital> createState() =>
      _HotelState();
}

class _HotelState extends State<Hospital> {
  bool isLoggedIn = false;

  final List<Map<String, dynamic>> attractions = [
      {
      "title": "Tezpur Medical College and Hospital (TMCH)",
      "description": "Tezpur Medical College and Hospital (TMCH), established in 2013, is a premier government medical institution located in Tezpur, Assam. Affiliated with the Srimanta Sankaradeva University of Health Sciences and recognized by the National Medical Commission (NMC), TMCH offers undergraduate (MBBS) and postgraduate (MD/MS) programs in various medical disciplines. The college was inaugurated to enhance medical education and healthcare services in the region and admits 125 MBBS students annually. Situated at Tumuki near the AH-15 highway, the campus is well-connected and serves the healthcare needs of a large population across Sonitpur district and nearby areas. TMCH plays a vital role in improving the medical infrastructure and accessibility in North Assam.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage5.jpg?alt=media&token=3b3334be-19fd-4152-ab44-331adb4e0b1c"],
      "latitude": "26.7005",
            "longitude": "92.8248",
    },
    {
      "title": "Dorika Hospital",
      "description":
          "Dorika Hospital is a leading multispecialty hospital located in Tezpur, Assam, known for providing high-quality and affordable healthcare services. Situated along NH 715 in Mazgaon, the hospital offers a wide range of medical specialties, including cardiology, orthopedics, gynecology, pediatrics, and emergency care. It also houses the Shankara Cancer & Research Institute (SCRI), a dedicated center for cancer treatment. With modern facilities, experienced doctors, and 24x7 emergency services, Dorika Hospital plays a crucial role in serving the healthcare needs of the region.",
      "imageUrls":[ "https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage14.png?alt=media&token=425e8409-253a-452b-8815-e1ee4a42ed02",
      ],
            "latitude": "26.652275554177823",
            "longitude": "92.79051139543937", 
    },
    {
      "title": "TIMeS Hospital",
      "description":
          "TIMeS Hospital, established in 2019, is a 130-bed multispecialty tertiary care hospital located in Tezpur, Assam. Equipped with state-of-the-art technology and infrastructure, the hospital offers comprehensive medical services under one roof, staffed by a team of full-time professionals across various specialties. The facility includes eight well-equipped operation theatres, a 12-bedded Intensive Care Unit (ICU), a 12-bedded Neonatal Intensive Care Unit (NICU), and a 4-bedded dialysis unit. Supporting facilities encompass a modern automated medical laboratory with provisions for a blood bank, GI endoscopy, cardiac lab, complete imaging solutions with the latest digital X-ray, ultrasonography units, a 32-slice CT scan, and a 1.5 Tesla MRI. TIMeS Hospital is committed to delivering quality healthcare services to the community, ensuring patient care with advanced medical facilities and a team of experienced professionals.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage15.jpg?alt=media&token=4f5cd43e-3833-4fa4-9255-54ac386858d9"],
        "latitude": "26.650831812283666",
        "longitude": "92.77441335311059", 
    },
    {
      "title": "Baptist Christian Hospital",
      "description":
          "Baptist Christian Hospital (BCH), located in Tezpur, Assam, is a 130-bed secondary care hospital dedicated to providing compassionate and affordable healthcare, particularly to marginalized communities. Established in 1954 by Dr. Charles C. Merchant as a small dispensary, it has since grown into a comprehensive medical facility offering a wide range of specialties, including general medicine, surgery, obstetrics and gynecology, pediatrics, orthopedics, dermatology, dentistry, physiotherapy, emergency and intensive care, palliative care, and urology . The hospital also houses a School of Nursing, established in the same year, which offers General Nursing and Midwifery (GNM) programs recognized by the Assam Nursing Council and the Indian Nursing Council. BCH is a unit of the Emmanuel Hospital Association, New Delhi, and is NABH Entry-Level certified, reflecting its commitment to maintaining high standards of hygiene, patient safety, and evidence-based medical practices.",
      "imageUrls": ["https://firebasestorage.googleapis.com/v0/b/tezpurapp-df4a9.firebasestorage.app/o/assets%2Fimage16.jpg?alt=media&token=dcd629e3-597c-4ec8-aa5b-682aed9cb649"
      ],
      "latitude": "26.65279418658663",
        "longitude": "92.7725660359186", 
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
        builder: (_) => const Hospital(
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
                "Hospitals in Tezpur",
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
