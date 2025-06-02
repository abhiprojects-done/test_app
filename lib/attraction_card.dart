import 'package:flutter/material.dart';
import 'package:test_app/food.dart';
import 'package:test_app/hotel.dart';
import 'package:test_app/maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_app/hospital.dart';
import 'package:test_app/details.dart';

class AttractionCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> imageUrls;
  final double latitude;
  final double longitude;

  const AttractionCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Image
          Stack(
            children: [
              imageUrls[0].startsWith('http')
                  ? Image.network(
                      imageUrls[0],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      imageUrls[0],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Read More
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TourDetailScreen(
                          title: title,
                          description: description,
                          imagePath: imageUrls[0],
                          imageUrls: imageUrls,
                          additionalImages: imageUrls,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Read more",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Nearby Luxuries
                const Text(
                  "Nearby amenities:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _luxuryItem(Icons.food_bank, "Food", onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Food()));
                    }),
                    _luxuryItem(Icons.hotel, "Hotel", onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hotel()));
                    }),
                    _luxuryItem(Icons.local_hospital, "Hospitals", onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hospital()));
                    }),
                    _luxuryItem(Icons.directions, "Direction", onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => TezpurTourismMap(
                            preselectedDestination: LatLng(latitude, longitude),
                            preselectedName: title,
                          ),
                        ));
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Icon for luxuries
  Widget _luxuryItem(IconData icon, String label, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.black54, size: 24),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
