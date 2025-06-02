import 'package:flutter/material.dart';

class TourDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> imageUrls;
  final List<String> additionalImages;

  const TourDetailScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.imagePath,
    required this.additionalImages,
  }) : super(key: key);

  void _showFullImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int displayCount = imageUrls.length > 6? 6 : imageUrls.length;
    int extraCount = imageUrls.length - 6;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ✅ Main image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imagePath, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),

          // ✅ Description
          Text(description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          
          const Text(
                "Photos:",
               style: TextStyle(
                   fontSize: 18,
                    fontWeight: FontWeight.bold,
                   ),
                  ),
                const SizedBox(height: 8),

          // ✅ Image grid
         GridView.builder(
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: 6,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
  ),
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () => _showFullImage(context, imageUrls[index]),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
          ),
          if (index == 5 && imageUrls.length > 6)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8), // Match border radius here too
              ),
              child: Center(
                child: Text(
                  '+${imageUrls.length - 6}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  },
),

        ],
      ),
    );
  }
}
