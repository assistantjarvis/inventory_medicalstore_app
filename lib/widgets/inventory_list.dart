import 'package:flutter/material.dart';
import 'package:medicalstore_app/models/inventory_item.dart';

class InventoryList extends StatelessWidget {
  final List<InventoryItem> items;
  final Function(InventoryItem) onEdit;

  const InventoryList({super.key, required this.items, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Category: ${item.category}\nQuantity: ${item.quantity}\nPrice: \$${item.price.toStringAsFixed(2)}\nExpiry: ${item.expiry}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => onEdit(item),
            ),
          ),
        );
      },
    );
  }
}