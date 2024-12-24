import 'package:challenge5/models/menu_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String categoryId;
  final double rating;
  final int reviewCount;
  final int minOrderAmount;
  final int deliveryFee;
  final String deliveryTime;
  final String imageUrl;
  final List<MenuItem> menuItems;

  const Restaurant({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.rating,
    required this.reviewCount,
    required this.minOrderAmount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.imageUrl,
    required this.menuItems,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      minOrderAmount: json['minOrderAmount'] as int,
      deliveryFee: json['deliveryFee'] as int,
      deliveryTime: json['deliveryTime'] as String,
      imageUrl: json['imageUrl'] as String,
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
      'rating': rating,
      'reviewCount': reviewCount,
      'minOrderAmount': minOrderAmount,
      'deliveryFee': deliveryFee,
      'deliveryTime': deliveryTime,
      'imageUrl': imageUrl,
      'menuItems': menuItems.map((item) => item.toJson()).toList(),
    };
  }
}
