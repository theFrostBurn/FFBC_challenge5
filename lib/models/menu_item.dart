class MenuItem {
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  int quantity;

  MenuItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.quantity = 0,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
