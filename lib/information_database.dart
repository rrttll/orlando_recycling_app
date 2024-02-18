import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InformationDatabasePage extends StatefulWidget {
  const InformationDatabasePage({Key? key}) : super(key: key);  // Key is correctly passed to super

  @override
  InformationDatabasePageState createState() => InformationDatabasePageState();
}

class InformationDatabasePageState extends State<InformationDatabasePage> {
  List? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    final response = await http.get(Uri.parse('https://curry-home.cheetoh-python.ts.net/api/v1/items'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orlando Recycling Information'),
      ),
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data![index]['name']),
                );
              },
            ),
    );
  }
}