import 'package:flutter/material.dart';
import 'package:challenge5/models/category.dart';
import 'package:challenge5/screens/category_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(category: category),
          ),
        );
      },
      child: SizedBox(
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  category.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
