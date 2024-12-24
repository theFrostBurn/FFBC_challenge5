import 'package:flutter/material.dart';
import 'package:challenge5/models/restaurant.dart';
import 'package:challenge5/widgets/restaurant_card.dart';
import 'package:challenge5/widgets/toggle_button.dart';
import 'package:challenge5/data/dummy_data.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  bool _isFirstSelected = true;
  List<Restaurant> _restaurants = [];
  bool _isLoading = true;

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

      final restaurants = await getRestaurants(
        isPopular: _isFirstSelected,
        isRecommended: !_isFirstSelected,
      );
      if (mounted) {
        setState(() {
          _restaurants = restaurants;
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

  List<Restaurant> get _filteredRestaurants {
    if (_isFirstSelected) {
      // 평점 순으로 정렬
      return List.from(_restaurants)
        ..sort((a, b) => b.rating.compareTo(a.rating));
    } else {
      // 임의로 섞어서 반환 (실제로는 실시간 주문 데이터 기반으로 구현)
      return List.from(_restaurants)..shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        ToggleButton(
          isFirstSelected: _isFirstSelected,
          onFirstPressed: () {
            setState(() {
              _isFirstSelected = true;
              _loadRestaurants();
            });
          },
          onSecondPressed: () {
            setState(() {
              _isFirstSelected = false;
              _loadRestaurants();
            });
          },
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: _restaurants[index]);
            },
          ),
      ],
    );
  }
}
