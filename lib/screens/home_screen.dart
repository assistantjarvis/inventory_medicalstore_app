import 'package:flutter/material.dart';
import 'package:medicalstore_app/models/inventory_item.dart';
import 'package:medicalstore_app/repositories/inventory_repository.dart';
import 'package:medicalstore_app/screens/add_edit_screen.dart';
import 'package:medicalstore_app/widgets/inventory_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = InventoryRepository()
        .getItems()
        .where((item) {
          final inventoryItem = item as InventoryItem?;
          return (inventoryItem?.name.toLowerCase() ?? '').contains(_searchTerm.toLowerCase()) ||
              (inventoryItem?.category.toLowerCase() ?? '').contains(_searchTerm.toLowerCase());
        })
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Store Inventory'),
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or category...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: InventoryList(
                items: filteredItems,
                onEdit: (item) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditScreen(
                        item: item,
                        onSave: (updatedItem) {
                          setState(() {
                            InventoryRepository().updateItem(updatedItem);
                          });
                        },
                        onDelete: (id) {
                          setState(() {
                            InventoryRepository().deleteItem(id);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditScreen(
                onSave: (newItem) {
                  setState(() {
                    InventoryRepository().addItem(newItem);
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: Colors.blue[600],
        child: const Icon(Icons.add),
      ),
    );
  }
}