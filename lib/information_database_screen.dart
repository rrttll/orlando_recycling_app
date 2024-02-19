import 'package:flutter/material.dart';
import 'package:orlando_recycling_app/services/api_service.dart'; // Add this line

class InformationDatabaseScreen extends StatefulWidget {
  const InformationDatabaseScreen({Key? key}) : super(key: key);

  @override
  InformationDatabaseScreenState createState() => InformationDatabaseScreenState();
}

class InformationDatabaseScreenState extends State<InformationDatabaseScreen> {
  late Future<List<dynamic>> futureItems;
  final ApiService apiService = ApiService(); // Create an instance of ApiService

  @override
  void initState() {
    super.initState();
    futureItems = apiService.getItems(); // Call getItems() on the ApiService instance without any arguments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Database'),
      ),
      body: FutureBuilder<List<dynamic>>(
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