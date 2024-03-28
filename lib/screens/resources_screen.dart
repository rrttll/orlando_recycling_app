import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Resource Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan eros eu felis gravida, vel gravida nunc dictum. Integer nec ex feugiat, convallis ligula eget, euismod lectus. Quisque volutpat urna non ultricies vestibulum.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Educational Materials',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan eros eu felis gravida, vel gravida nunc dictum. Integer nec ex feugiat, convallis ligula eget, euismod lectus. Quisque volutpat urna non ultricies vestibulum.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
