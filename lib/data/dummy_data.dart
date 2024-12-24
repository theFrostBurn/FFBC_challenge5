import 'package:challenge5/models/category.dart';
import 'package:challenge5/models/promotion.dart';
import 'package:challenge5/models/restaurant.dart';
import 'package:challenge5/services/unsplash_service.dart';

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

Future<List<Restaurant>> getRestaurants() async {
  final List<String> images =
      await UnsplashService.getMultipleFoodImages(count: 2);

  return [
    Restaurant(
      id: 'r1',
      name: '크런치 치킨 공방',
      categoryId: 'c5',
      imageUrl: images[0],
      rating: 4.8,
      deliveryTime: '30-40분',
      minOrderAmount: 15000,
      menuItems: ['후라이드 치킨', '양념 치킨', '간장 치킨'],
    ),
    Restaurant(
      id: 'r2',
      name: '달인의 김밥천국',
      categoryId: 'c7',
      imageUrl: images[1],
      rating: 4.5,
      deliveryTime: '15-25분',
      minOrderAmount: 12000,
      menuItems: ['김밥', '라면', '떡볶이'],
    ),
  ];
}

Future<List<Promotion>> getPromotions() async {
  final List<String> images =
      await UnsplashService.getMultipleFoodImages(count: 5);

  return [
    Promotion(
      id: 'p1',
      title: '신규 가입 이벤트',
      description: '첫 주문 3,000원 할인',
      imageUrl: images[0],
      discountAmount: 3000,
      validUntil: DateTime.now().add(const Duration(days: 30)),
    ),
    Promotion(
      id: 'p2',
      title: '크런치 치킨 공방 할인',
      description: '15,000원 이상 주문시 2,000원 할인',
      imageUrl: images[1],
      discountAmount: 2000,
      validUntil: DateTime.now().add(const Duration(days: 7)),
    ),
    Promotion(
      id: 'p3',
      title: '점심 특별 할인',
      description: '11:00-14:00 주문시 배달비 무료',
      imageUrl: images[2],
      discountAmount: 3000,
      validUntil: DateTime.now().add(const Duration(days: 14)),
    ),
    Promotion(
      id: 'p4',
      title: '프리미엄 회원 혜택',
      description: '모든 주문 10% 추가 할인',
      imageUrl: images[3],
      discountAmount: 0, // 퍼센트 할인
      validUntil: DateTime.now().add(const Duration(days: 365)),
    ),
    Promotion(
      id: 'p5',
      title: '설날 특별 이벤트',
      description: '명절 음식 주문시 5,000원 할인',
      imageUrl: images[4],
      discountAmount: 5000,
      validUntil: DateTime.now().add(const Duration(days: 10)),
    ),
  ];
}
