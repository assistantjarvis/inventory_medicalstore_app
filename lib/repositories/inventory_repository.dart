
import 'package:medicalstore_app/models/inventory_item.dart';

class InventoryRepository {
  List<InventoryItem> _items = [
    InventoryItem(
      id: 1,
      name: "Paracetamol 500mg",
      category: "Analgesic",
      quantity: 100,
      price: 10.50,
      expiry: "2026-12-31",
    ),
    InventoryItem(
      id: 2,
      name: "Amoxicillin 250mg",
      category: "Antibiotic",
      quantity: 50,
      price: 25.00,
      expiry: "2025-11-30",
    ),
  ];

  List<InventoryItem> getItems() => _items;

  void addItem(InventoryItem item) {
    _items.add(item);
  }

  void updateItem(InventoryItem updatedItem) {
    _items = _items.map((item) => item.id == updatedItem.id ? updatedItem : item).toList();
  }

  void deleteItem(int id) {
    _items = _items.where((item) => item.id != id).toList();
  }
}