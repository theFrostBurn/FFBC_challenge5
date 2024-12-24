import 'package:flutter/material.dart';
import 'package:challenge5/widgets/category_grid.dart';
import 'package:challenge5/widgets/promotion_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FOODIGO🍽️',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CategoryGrid(),
            SizedBox(height: 16),
            PromotionSlider(),
            // 추후 추천 리스트가 추가될 예정
          ],
        ),
      ),
    );
  }
}
