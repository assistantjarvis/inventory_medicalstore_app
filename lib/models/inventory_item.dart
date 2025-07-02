class InventoryItem {
  final int id;
  final String name;
  final String category;
  final int quantity;
  final double price;
  final String expiry;

  InventoryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.price,
    required this.expiry,
  });

  InventoryItem copyWith({
    int? id,
    String? name,
    String? category,
    int? quantity,
    double? price,
    String? expiry,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      expiry: expiry ?? this.expiry,
    );
  }
}
