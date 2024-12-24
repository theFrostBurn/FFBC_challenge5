import 'package:flutter/material.dart';
import 'package:challenge5/models/category.dart';
import 'package:challenge5/data/dummy_data.dart';
import 'package:challenge5/widgets/category_item.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.9,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        return CategoryItem(category: dummyCategories[index]);
      },
    );
  }
}
