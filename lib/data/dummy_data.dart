import 'package:challenge5/models/category.dart';
import 'package:challenge5/models/promotion.dart';
import 'package:challenge5/models/restaurant.dart';
import 'package:challenge5/models/menu_item.dart';
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

Future<List<Restaurant>> getRestaurants({bool isPopular = true}) async {
  // 인기 맛집용 이미지 24개 (8개 카테고리 x 3개 음식점)
  final List<String> topImages = await UnsplashService.getMultipleFoodImages(
    query: 'gourmet restaurant food',
    count: 24,
  );

  // 실시간 주문용 이미지 24개
  final List<String> trendingImages =
      await UnsplashService.getMultipleFoodImages(
    query: 'street food local',
    count: 24,
  );

  final List<Restaurant> topRestaurants = [
    Restaurant(
      id: 'r1',
      name: '할매 순대국',
      categoryId: 'c1',
      imageUrl: topImages[0],
      rating: 4.8,
      deliveryTime: '15-25분',
      minOrderAmount: 9000,
      menuItems: [
        MenuItem(
          name: '순대국밥',
          description: '진한 국물이 일품인 전통 순대국밥',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '순대국밥'),
          price: 9000,
        ),
        MenuItem(
          name: '내장국밥',
          description: '담백하고 깊은 맛의 내장국밥',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '국밥'),
          price: 9500,
        ),
        MenuItem(
          name: '공기밥',
          description: '고슬고슬한 흰쌀밥',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '쌀밥'),
          price: 1000,
        ),
      ],
    ),
    // 중식 (c2)
    Restaurant(
      id: 'r2',
      name: '황금 짬뽕',
      categoryId: 'c2',
      imageUrl: trendingImages[0], // trendingImages 활용
      rating: 4.8,
      deliveryTime: '20-30분',
      minOrderAmount: 16000,
      menuItems: [
        MenuItem(
          name: '짬뽕',
          description: '해산물이 풍부한 얼큰한 짬뽕',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '짬뽕'),
          price: 8000,
        ),
        MenuItem(
          name: '짜장면',
          description: '춘장의 깊은 맛이 일품인 짜장면',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '짜장면'),
          price: 7000,
        ),
        MenuItem(
          name: '탕수육',
          description: '바삭하고 달콤한 탕수육',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '탕수육'),
          price: 16000,
        ),
      ],
    ),
    // ... 나머지 레스토랑들도 비슷한 형식으로 추가
  ];

  final List<Restaurant> trendingRestaurants = [
    // trendingImages를 활용한 레스토랑 목록
    Restaurant(
      id: 't1',
      name: '스트릿 푸드 킹',
      categoryId: 'c7',
      imageUrl: trendingImages[1],
      rating: 4.6,
      deliveryTime: '15-25분',
      minOrderAmount: 12000,
      menuItems: [
        MenuItem(
          name: '길거리 토스트',
          description: '계란과 채소가 듬뿍 들어간 토스트',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '토스트'),
          price: 3500,
        ),
        MenuItem(
          name: '떡볶이',
          description: '매콤달콤한 국민간식',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '떡볶이'),
          price: 4000,
        ),
        MenuItem(
          name: '튀김세트',
          description: '바삭바삭한 모듬튀김',
          imageUrl: await UnsplashService.getRandomFoodImage(query: '튀김'),
          price: 5000,
        ),
      ],
    ),
    // ... 더 많은 trending 레스토랑 추가
  ];

  return isPopular ? topRestaurants : trendingRestaurants;
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
