// File: /lib/screens/information_database_screen.dart
import 'package:flutter/material.dart';
import 'package:recycling_app/services/api_service.dart';

class InformationDatabaseScreen extends StatefulWidget {
  // Updated constructor with super parameter syntax
  const InformationDatabaseScreen({super.key});

  @override
  InformationDatabaseScreenState createState() => InformationDatabaseScreenState();
}

class InformationDatabaseScreenState extends State<InformationDatabaseScreen> {
  late Future<List> futureItems;
  final ApiService apiService = ApiService(); // Create an instance of ApiService

  @override
  void initState() {
    super.initState();
    futureItems = apiService.getItems(); // Call getItems() on the ApiService instance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Database'),
      ),
      body: FutureBuilder<List>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]['name']),
                  subtitle: Text(snapshot.data![index]['recyclingInstructions']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
