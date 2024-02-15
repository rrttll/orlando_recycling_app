import 'package:flutter/material.dart';

class RecyclableItem {
  final String name;
  final String recyclingInstructions;

  const RecyclableItem({
    required this.name,
    required this.recyclingInstructions,
  });
}

class InformationDatabaseScreen extends StatelessWidget {
  final List<RecyclableItem> items = const [
    RecyclableItem(name: 'Paper', recyclingInstructions: 'Put in the blue bin'),
    RecyclableItem(name: 'Plastic', recyclingInstructions: 'Put in the yellow bin'),
    // Add more items here
  ];

  const InformationDatabaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Database'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(items[index].recyclingInstructions),
          );
        },
      ),
    );
  }
}