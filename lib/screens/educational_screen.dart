//File: lib/screens/educational_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Educational"),
        backgroundColor:
            Colors.green[700], // Theme color for environmental topics
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(text: 'Educational Resources and Links'),
            EducationalCard(
              title: 'Local Recycling Initiatives',
              description:
                  "Learn about recycling initiatives in Orlando and how you can participate.",
              assetName: 'assets/recycling_initiatives.jpg',
              url: 'https://www.orlando.gov/Trash-Recycling',
            ),
            EducationalCard(
              title: 'Sustainable Living Tips',
              description:
                  "Discover ways to live sustainably and reduce your environmental footprint.",
              assetName: 'assets/sustainable_living.jpg',
              url:
                  'https://www.orlando.gov/Trash-Recycling/Trash-Recycling-Yard-Waste-Pick-Up-Schedule',
            ),
            EducationalCard(
              title: 'Sustainable Living Tips',
              description:
                  "Do you need a new or replacement trash or recycling cart?",
              assetName: 'assets/recycling_cans.png',
              url:
                  'https://www.orlando.gov/Trash-Recycling/Request-a-Trash-or-Recycling-Cart',
            ),
            SectionHeading(text: 'More Helpful Videos'),
            VideoCard(
              assetName: 'assets/Captain_Orlando_Recycling_Mission.mp4',
              description:
                  "Watch how recycling is making a difference in Orlando.",
            ),
            SectionHeading(text: 'Did You Know?'),
            FactCard(
              fact:
                  "Recycling one aluminum can saves enough energy to run a TV for three hours.",
              assetName: 'assets/think_green.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String text;

  const SectionHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green[800]),
      ),
    );
  }
}

class EducationalCard extends StatelessWidget {
  final String title;
  final String description;
  final String assetName;
  final String url;

  const EducationalCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.assetName,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.asset(assetName, width: 56, fit: BoxFit.cover),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Could not open the link")),
            );
          }
        },
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String assetName;
  final String description;

  const VideoCard(
      {Key? key, required this.assetName, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Image.asset(assetName, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}

class FactCard extends StatelessWidget {
  final String fact;
  final String assetName;

  const FactCard({Key? key, required this.fact, required this.assetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.asset(assetName, width: 56, fit: BoxFit.cover),
        title: Text(fact),
      ),
    );
  }
}
