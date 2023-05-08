import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'item_details.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<dynamic> items = [];
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=$currentPage'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        items.addAll(data['data']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),centerTitle: true,backgroundColor: Colors.black,
        elevation: 0,titleSpacing: 5,titleTextStyle:  TextStyle(
        letterSpacing: 5,color: Colors.white
      ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return ListTile(
            title: Text('${item['first_name']} ${item['last_name']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemDetails(item: item)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          currentPage++;
          fetchItems();
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}