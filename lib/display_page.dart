import 'package:flutter/material.dart';
import 'package:exam_fetch/services/dtb_service.dart'; // FirestoreService
import 'package:exam_fetch/model/meal_mdl.dart'; // Item model
import 'package:exam_fetch/customWidgets/displayCard.dart'; // DisplayCard widget

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  List<Item> items = [];
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    try {
      var fetchedItems = await FirestoreService().fetchAllItems();
      setState(() {
        items = fetchedItems;  
        isLoading = false;  
      });
    } catch (e) {
      setState(() {
        isLoading = false;  
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to fetch data: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items List"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())  
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return DisplayCard(item: item);  
              },
            ),
    );
  }
}
