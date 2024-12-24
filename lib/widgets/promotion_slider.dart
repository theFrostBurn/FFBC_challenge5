import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:challenge5/data/dummy_data.dart';
import 'package:challenge5/widgets/promotion_card.dart';
import 'package:challenge5/models/promotion.dart';

class PromotionSlider extends StatefulWidget {
  const PromotionSlider({super.key});

  @override
  State<PromotionSlider> createState() => _PromotionSliderState();
}

class _PromotionSliderState extends State<PromotionSlider> {
  int _currentIndex = 0;
  List<Promotion> _promotions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPromotions();
  }

  Future<void> _loadPromotions() async {
    try {
      final promotions = await getPromotions();
      if (mounted) {
        setState(() {
          _promotions = promotions;
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
            content: Text('프로모션을 불러오는데 실패했습니다: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _promotions.map((promotion) {
            return PromotionCard(promotion: promotion);
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _promotions.asMap().entries.map((entry) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withAlpha(
                      _currentIndex == entry.key ? 255 : 102,
                    ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
