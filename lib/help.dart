import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Frequently Asked Questions", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            _faqItem("How do I book a tour?", 
                "Click on a destination and tap 'Read More' to get details."),
            _faqItem("Can I cancel a booking?", 
                "Yes, cancellations are allowed within 24 hours."),
            _faqItem("How to contact customer support?", 
                "You can email us or call our support team."),

            const SizedBox(height: 20),

            const Text("Need More Help?", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.email),
              label: const Text("Contact Support"),
              onPressed: () {
                // Implement email/call function here
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _faqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 3),
          Text(answer, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
