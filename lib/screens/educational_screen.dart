import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Educational")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Educational Resources and Links',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 16),
            CustomButton(
              platform: 'Orlando Recycling',
              onPressed: () async {
                const url = 'https://www.orlando.gov/Trash-Recycling';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Could not open the link"),
                    ),
                  );
                }
              },
            ),
            Text(
                "Here you will find more information on recycling practices and how you can make a greater impact on your community."),
            SizedBox(height: 16),
            Text(
              'More Helpful Videos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            AspectRatio(
              aspectRatio: 16 / 9, // Aspect ratio of the image
              child: Image.network(
                'https://i.ytimg.com/vi/kZbqTQt8jQQ/maxresdefault.jpg',
                fit: BoxFit
                    .cover, // Covers the available space, might crop the image
              ),
            ),
            Text(
                "Watch how recycling is piling up in Orlando and how you can be a part of the solution."),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String platform;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key, required this.platform, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
              "For more information and resources, please refer to the $platform website."),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  Colors.green, // Updated from 'primary' to 'foregroundColor'
            ),
            onPressed: onPressed,
            child: Text(platform),
          ),
        ],
      ),
    );
  }
}
