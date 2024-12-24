import 'package:challenge5/models/menu_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String categoryId;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final int minOrderAmount;
  final List<MenuItem> menuItems;

  Restaurant({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.minOrderAmount,
    required this.menuItems,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      deliveryTime: json['deliveryTime'] as String,
      minOrderAmount: json['minOrderAmount'] as int,
      menuItems: (json['menuItems'] as List)
          .map((item) => MenuItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'imageUrl': imageUrl,
      'rating': rating,
      'deliveryTime': deliveryTime,
      'minOrderAmount': minOrderAmount,
      'menuItems': menuItems,
    };
  }
}
