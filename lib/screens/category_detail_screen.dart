import 'package:flutter/material.dart';
import 'package:challenge5/models/category.dart';
import 'package:challenge5/models/restaurant.dart';
import 'package:challenge5/widgets/restaurant_card.dart';
import 'package:challenge5/data/dummy_data.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category category;

  const CategoryDetailScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  List<Restaurant> _restaurants = [];
  bool _isLoading = true;
  String _sortBy = 'rating'; // 'rating' or 'minOrder'

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // 해당 카테고리의 음식점만 필터링
      final allRestaurants = await getRestaurants();
      final categoryRestaurants = allRestaurants
          .where((r) => r.categoryId == widget.category.id)
          .toList();

      if (mounted) {
        setState(() {
          _restaurants = categoryRestaurants;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('음식점 정보를 불러오는데 실패했습니다: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _sortRestaurants() {
    setState(() {
      if (_sortBy == 'rating') {
        _restaurants.sort((a, b) => b.rating.compareTo(a.rating));
      } else {
        _restaurants
            .sort((a, b) => a.minOrderAmount.compareTo(b.minOrderAmount));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category.name} ${widget.category.emoji}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() {
                _sortBy = value;
                _sortRestaurants();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'rating',
                child: Text('평점순'),
              ),
              const PopupMenuItem(
                value: 'minOrder',
                child: Text('최소주문금액순'),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _restaurants.isEmpty
              ? Center(
                  child: Text(
                    '${widget.category.name} 카테고리에\n등록된 음식점이 없습니다.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: _restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantCard(restaurant: _restaurants[index]);
                  },
                ),
    );
  }
}
