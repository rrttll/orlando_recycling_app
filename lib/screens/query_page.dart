import 'package:flutter/material.dart';
import '../services/api_service.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({Key? key}) : super(key: key);

  @override
  QueryPageState createState() => QueryPageState();
}

class QueryPageState extends State<QueryPage> {
  final _apiService = ApiService();
  String _item = '';

  @override
  void initState() {
    super.initState();
    _fetchItem();
  }

  void _fetchItem() async {
    var item = await _apiService.getItem('1'); // Call getItem() on the ApiService instance with only one argument
    setState(() {
      _item = item.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Query Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            if (_item.isNotEmpty)
              Text('Fetched item: $_item'),
          ],
        ),
      ),
    );
  }
}