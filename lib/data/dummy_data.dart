import 'package:challenge5/models/category.dart';
import 'package:challenge5/models/promotion.dart';
import 'package:challenge5/models/restaurant.dart';

final List<Category> dummyCategories = [
  Category(
    id: 'c1',
    name: '한식',
    emoji: '🍚',
    description: '한국의 전통 음식',
  ),
  Category(
    id: 'c2',
    name: '중식',
    emoji: '🥢',
    description: '중국의 전통 음식',
  ),
  Category(
    id: 'c3',
    name: '일식',
    emoji: '🍱',
    description: '일본의 전통 음식',
  ),
  Category(
    id: 'c4',
    name: '양식',
    emoji: '🍝',
    description: '서양의 전통 음식',
  ),
  Category(
    id: 'c5',
    name: '치킨',
    emoji: '🍗',
    description: '치킨 전문점',
  ),
  Category(
    id: 'c6',
    name: '피자',
    emoji: '🍕',
    description: '피자 전문점',
  ),
  Category(
    id: 'c7',
    name: '분식',
    emoji: '🥘',
    description: '분식류 전문점',
  ),
  Category(
    id: 'c8',
    name: '디저트',
    emoji: '🍰',
    description: '디저트 전문점',
  ),
];

final List<Restaurant> dummyRestaurants = [
  Restaurant(
    id: 'r1',
    name: '크런치 치킨 공방',
    categoryId: 'c5',
    imageUrl: 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec',
    rating: 4.8,
    deliveryTime: '30-40분',
    minOrderAmount: 15000,
    menuItems: ['후라이드 치킨', '양념 치킨', '간장 치킨'],
  ),
  Restaurant(
    id: 'r2',
    name: '달인의 김밥천국',
    categoryId: 'c7',
    imageUrl: 'https://images.unsplash.com/photo-1580651315530-69c8e0026377',
    rating: 4.5,
    deliveryTime: '15-25분',
    minOrderAmount: 12000,
    menuItems: ['김밥', '라면', '떡볶이'],
  ),
];

final List<Promotion> dummyPromotions = [
  Promotion(
    id: 'p1',
    title: '신규 가입 이벤트',
    description: '첫 주문 3,000원 할인',
    imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    discountAmount: 3000,
    validUntil: DateTime.now().add(const Duration(days: 30)),
  ),
];
