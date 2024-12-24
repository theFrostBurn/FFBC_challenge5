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

final List<Restaurant> dummyRestaurants = [
  // 한식 (c1)
  Restaurant(
    id: 'r1',
    name: '맛있는 국밥집',
    categoryId: 'c1',
    rating: 4.8,
    reviewCount: 128,
    minOrderAmount: 12000,
    deliveryFee: 3000,
    deliveryTime: '15-25분',
    imageUrl: UnsplashService.defaultFoodImages['맛있는 국밥집']!,
    menuItems: [
      MenuItem(
        name: '순대국밥',
        price: 9000,
        description: '진한 국물의 순대국밥',
        imageUrl: UnsplashService.defaultFoodImages['순대국밥']!,
      ),
      MenuItem(
        name: '내장국밥',
        price: 9000,
        description: '담백한 내장국밥',
        imageUrl: UnsplashService.defaultFoodImages['순대국밥']!,
      ),
      MenuItem(
        name: '공기밥',
        price: 1000,
        description: '고슬고슬한 흰쌀밥',
        imageUrl: UnsplashService.defaultFoodImages['순대국밥']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r9',
    name: '할매보쌈',
    categoryId: 'c1',
    rating: 4.7,
    reviewCount: 245,
    minOrderAmount: 20000,
    deliveryFee: 3000,
    deliveryTime: '25-35분',
    imageUrl: UnsplashService.defaultFoodImages['보쌈']!,
    menuItems: [
      MenuItem(
        name: '보쌈',
        price: 25000,
        description: '부드러운 보쌈',
        imageUrl: UnsplashService.defaultFoodImages['보쌈']!,
      ),
      MenuItem(
        name: '족발',
        price: 30000,
        description: '쫄깃한 족발',
        imageUrl: UnsplashService.defaultFoodImages['보쌈']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r13',
    name: '서울식당',
    categoryId: 'c1',
    rating: 4.6,
    reviewCount: 156,
    minOrderAmount: 10000,
    deliveryFee: 2000,
    deliveryTime: '15-25분',
    imageUrl: UnsplashService.defaultFoodImages['된장찌개']!,
    menuItems: [
      MenuItem(
        name: '된장찌개',
        price: 8000,
        description: '구수한 된장찌개',
        imageUrl: UnsplashService.defaultFoodImages['된장찌개']!,
      ),
      // ... 추가 메뉴
    ],
  ),

  // 중식 (c2)
  Restaurant(
    id: 'r2',
    name: '중화반점',
    categoryId: 'c2',
    rating: 4.5,
    reviewCount: 92,
    minOrderAmount: 15000,
    deliveryFee: 2000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['중화반점']!,
    menuItems: [
      MenuItem(
        name: '짜장면',
        price: 7000,
        description: '정통 중국식 짜장면',
        imageUrl: UnsplashService.defaultFoodImages['짜장면']!,
      ),
      MenuItem(
        name: '짬뽕',
        price: 8000,
        description: '얼큰한 해물 짬뽕',
        imageUrl: UnsplashService.defaultFoodImages['짬뽕']!,
      ),
      MenuItem(
        name: '탕수육',
        price: 15000,
        description: '바삭한 탕수육',
        imageUrl: UnsplashService.defaultFoodImages['탕수육']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r10',
    name: '대명반점',
    categoryId: 'c2',
    rating: 4.6,
    reviewCount: 178,
    minOrderAmount: 15000,
    deliveryFee: 2000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['마라탕']!,
    menuItems: [
      MenuItem(
        name: '마라탕',
        price: 12000,
        description: '얼얼한 마라탕',
        imageUrl: UnsplashService.defaultFoodImages['마라탕']!,
      ),
      MenuItem(
        name: '양장피',
        price: 20000,
        description: '신선한 양장피',
        imageUrl: UnsplashService.defaultFoodImages['양장피']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r14',
    name: '홍콩반점',
    categoryId: 'c2',
    rating: 4.5,
    reviewCount: 178,
    minOrderAmount: 15000,
    deliveryFee: 2000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['중화반점']!,
    menuItems: [
      MenuItem(
        name: '유린기',
        price: 18000,
        description: '바삭한 유린기',
        imageUrl: UnsplashService.defaultFoodImages['탕수육']!,
      ),
      // ... 추가 메뉴
    ],
  ),

  // 일식 (c3)
  Restaurant(
    id: 'r3',
    name: '스시히로',
    categoryId: 'c3',
    rating: 4.9,
    reviewCount: 215,
    minOrderAmount: 20000,
    deliveryFee: 4000,
    deliveryTime: '25-35분',
    imageUrl: UnsplashService.defaultFoodImages['스시히로']!,
    menuItems: [
      MenuItem(
        name: '모듬초밥',
        price: 25000,
        description: '신선한 모듬초밥 12pcs',
        imageUrl: UnsplashService.defaultFoodImages['초밥']!,
      ),
      MenuItem(
        name: '연어초밥',
        price: 15000,
        description: '노르웨이산 연어초밥 8pcs',
        imageUrl: UnsplashService.defaultFoodImages['초밥']!,
      ),
      MenuItem(
        name: '우동',
        price: 8000,
        description: '깊은 맛의 우동',
        imageUrl: UnsplashService.defaultFoodImages['우동']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r11',
    name: '돈카츠 히로',
    categoryId: 'c3',
    rating: 4.8,
    reviewCount: 312,
    minOrderAmount: 13000,
    deliveryFee: 3000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['돈카츠']!,
    menuItems: [
      MenuItem(
        name: '히레카츠',
        price: 11000,
        description: '부드러운 히레카츠',
        imageUrl: UnsplashService.defaultFoodImages['돈카츠']!,
      ),
      MenuItem(
        name: '로스카츠',
        price: 12000,
        description: '두툼한 로스카츠',
        imageUrl: UnsplashService.defaultFoodImages['돈카츠']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r15',
    name: '라멘 이치방',
    categoryId: 'c3',
    rating: 4.7,
    reviewCount: 234,
    minOrderAmount: 11000,
    deliveryFee: 3000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['라멘']!,
    menuItems: [
      MenuItem(
        name: '돈코츠라멘',
        price: 9000,
        description: '진한 돈코라멘',
        imageUrl: UnsplashService.defaultFoodImages['라멘']!,
      ),
      // ... 추가 메뉴
    ],
  ),

  // 양식 (c4)
  Restaurant(
    id: 'r4',
    name: '파스타 공방',
    categoryId: 'c4',
    rating: 4.7,
    reviewCount: 167,
    minOrderAmount: 15000,
    deliveryFee: 3000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['파스타 공방']!,
    menuItems: [
      MenuItem(
        name: '까르보나라',
        price: 13000,
        description: '크리미한 까르보나라',
        imageUrl: UnsplashService.defaultFoodImages['파스타']!,
      ),
      MenuItem(
        name: '토마토파스타',
        price: 12000,
        description: '신선한 토마토 파스타',
        imageUrl: UnsplashService.defaultFoodImages['파스타']!,
      ),
      MenuItem(
        name: '새우크림파스타',
        price: 14000,
        description: '통새우 크림파스타',
        imageUrl: UnsplashService.defaultFoodImages['파스타']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r12',
    name: '스테이크 하우스',
    categoryId: 'c4',
    rating: 4.9,
    reviewCount: 423,
    minOrderAmount: 25000,
    deliveryFee: 4000,
    deliveryTime: '25-35분',
    imageUrl: UnsplashService.defaultFoodImages['스테이크']!,
    menuItems: [
      MenuItem(
        name: '티본스테이크',
        price: 35000,
        description: '프리미엄 티본스테이크',
        imageUrl: UnsplashService.defaultFoodImages['스테이크']!,
      ),
      MenuItem(
        name: '안심스테이크',
        price: 30000,
        description: '부드러운 안심스테이크',
        imageUrl: UnsplashService.defaultFoodImages['스테이크']!,
      ),
    ],
  ),
  Restaurant(
    id: 'r16',
    name: '피자 팩토리',
    categoryId: 'c6',
    rating: 4.6,
    reviewCount: 198,
    minOrderAmount: 18000,
    deliveryFee: 2000,
    deliveryTime: '30-40분',
    imageUrl: UnsplashService.defaultFoodImages['피자']!,
    menuItems: [
      MenuItem(
        name: '마르게리타 피자',
        price: 18000,
        description: '클래식 마르게리타',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
      MenuItem(
        name: '하와이안 피자',
        price: 19000,
        description: '파인애플이 들어간 하와이안 피자',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
      MenuItem(
        name: '고구마 피자',
        price: 20000,
        description: '달콤한 고구마 피자',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
    ],
  ),

  // 치킨 (c5)
  Restaurant(
    id: 'r5',
    name: '바삭치킨',
    categoryId: 'c5',
    rating: 4.6,
    reviewCount: 320,
    minOrderAmount: 16000,
    deliveryFee: 2000,
    deliveryTime: '40-50분',
    imageUrl: UnsplashService.defaultFoodImages['후라이드치킨']!,
    menuItems: [
      MenuItem(
        name: '후라이드치킨',
        price: 16000,
        description: '바삭바삭한 후라이드치킨',
        imageUrl: UnsplashService.defaultFoodImages['후라이드치킨']!,
      ),
      MenuItem(
        name: '양념치킨',
        price: 17000,
        description: '매콤달콤한 양념치킨',
        imageUrl: UnsplashService.defaultFoodImages['양념치킨']!,
      ),
      MenuItem(
        name: '간장치킨',
        price: 17000,
        description: '달콤짭짤한 간장치킨',
        imageUrl: UnsplashService.defaultFoodImages['양념치킨']!,
      ),
      MenuItem(
        name: '반반치킨',
        price: 17000,
        description: '후라이드와 양념의 만남',
        imageUrl: UnsplashService.defaultFoodImages['후라이드치킨']!,
      ),
    ],
  ),

  // 피자 (c6)
  Restaurant(
    id: 'r6',
    name: '피자마스터',
    categoryId: 'c6',
    rating: 4.8,
    reviewCount: 284,
    minOrderAmount: 18000,
    deliveryFee: 3000,
    deliveryTime: '30-40분',
    imageUrl: UnsplashService.defaultFoodImages['피자']!,
    menuItems: [
      MenuItem(
        name: '치비네이션 피자',
        price: 19000,
        description: '모든 토핑이 들어간 피자',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
      MenuItem(
        name: '페퍼로니피자',
        price: 18000,
        description: '클래식 페퍼로니피자',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
      MenuItem(
        name: '치트로 치즈피자',
        price: 20000,
        description: '4가지 치즈의 풍미',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
      MenuItem(
        name: '불고기 피자',
        price: 21000,
        description: '달콤한 불고기가 듬뿍',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
    ],
  ),

  // 분식 (c7)
  Restaurant(
    id: 'r7',
    name: '이모네분식',
    categoryId: 'c7',
    rating: 4.5,
    reviewCount: 156,
    minOrderAmount: 12000,
    deliveryFee: 2000,
    deliveryTime: '15-25분',
    imageUrl:
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
    menuItems: [
      MenuItem(
        name: '떡볶이',
        price: 4500,
        description: '매콤달콤한 떡볶이',
        imageUrl:
            'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
      ),
      MenuItem(
        name: '김밥',
        price: 3500,
        description: '신선한 김밥',
        imageUrl:
            'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
      ),
    ],
  ),

  // 디저트 (c8)
  Restaurant(
    id: 'r8',
    name: '달콤카페',
    categoryId: 'c8',
    rating: 4.7,
    reviewCount: 198,
    minOrderAmount: 15000,
    deliveryFee: 2000,
    deliveryTime: '15-25분',
    imageUrl: UnsplashService.defaultFoodImages['달콤카페']!,
    menuItems: [
      MenuItem(
        name: '티라미수',
        price: 6500,
        description: '부드러운 티라미수',
        imageUrl: UnsplashService.defaultFoodImages['티라미수']!,
      ),
      MenuItem(
        name: '초코케이크',
        price: 7000,
        description: '진한 초콜릿 케이크',
        imageUrl: UnsplashService.defaultFoodImages['티라미수']!,
      ),
      MenuItem(
        name: '딸기 생크림케이크',
        price: 7500,
        description: '신선한 딸기 생크림케이크',
        imageUrl: UnsplashService.defaultFoodImages['티라미수']!,
      ),
      MenuItem(
        name: '크로플',
        price: 5500,
        description: '바삭한 크로플',
        imageUrl: UnsplashService.defaultFoodImages['티라미수']!,
      ),
      MenuItem(
        name: '아메리카노',
        price: 4000,
        description: '깊은 맛의 아메리카노',
        imageUrl: UnsplashService.defaultFoodImages['티라미수']!,
      ),
    ],
  ),

  // 치킨 (c5) 추가
  Restaurant(
    id: 'r17',
    name: '황금올리브치킨',
    categoryId: 'c5',
    rating: 4.8,
    reviewCount: 452,
    minOrderAmount: 18000,
    deliveryFee: 3000,
    deliveryTime: '35-45분',
    imageUrl: UnsplashService.defaultFoodImages['후라이드치킨']!,
    menuItems: [
      MenuItem(
        name: '황금올리브치킨',
        price: 20000,
        description: '바삭한 황금올리브치킨',
        imageUrl: UnsplashService.defaultFoodImages['후라이드치킨']!,
      ),
      MenuItem(
        name: '양념치킨',
        price: 21000,
        description: '매콤달콤 양념치킨',
        imageUrl: UnsplashService.defaultFoodImages['양념치킨']!,
      ),
    ],
  ),

  // 피자 (c6) 추가
  Restaurant(
    id: 'r18',
    name: '도미노피자',
    categoryId: 'c6',
    rating: 4.6,
    reviewCount: 321,
    minOrderAmount: 19000,
    deliveryFee: 3000,
    deliveryTime: '30-40분',
    imageUrl: UnsplashService.defaultFoodImages['피자']!,
    menuItems: [
      MenuItem(
        name: '불고기피자',
        price: 25000,
        description: '한국인이 가장 사랑하는 피자',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
      MenuItem(
        name: '페퍼로니피자',
        price: 23000,
        description: '클래식 페퍼로니피자',
        imageUrl: UnsplashService.defaultFoodImages['피자']!,
      ),
    ],
  ),

  // 분식 (c7) 추가
  Restaurant(
    id: 'r19',
    name: '엽기떡볶이',
    categoryId: 'c7',
    rating: 4.5,
    reviewCount: 567,
    minOrderAmount: 12000,
    deliveryFee: 2000,
    deliveryTime: '15-25분',
    imageUrl:
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
    menuItems: [
      MenuItem(
        name: '엽기떡볶이',
        price: 14000,
        description: '매운맛 떡볶이',
        imageUrl:
            'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
      ),
      MenuItem(
        name: '치즈김밥',
        price: 5000,
        description: '치즈가 들어간 김밥',
        imageUrl:
            'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
      ),
    ],
  ),

  // 디저트 (c8) 추가
  Restaurant(
    id: 'r20',
    name: '설빙',
    categoryId: 'c8',
    rating: 4.7,
    reviewCount: 234,
    minOrderAmount: 15000,
    deliveryFee: 3000,
    deliveryTime: '20-30분',
    imageUrl: UnsplashService.defaultFoodImages['망고빙수']!,
    menuItems: [
      MenuItem(
        name: '망고빙수',
        price: 12000,
        description: '달콤한 망고빙수',
        imageUrl: UnsplashService.defaultFoodImages['망고빙수']!,
      ),
      MenuItem(
        name: '초코빙수',
        price: 11000,
        description: '초콜릿 가득 빙수',
        imageUrl: UnsplashService.defaultFoodImages['망고빙수']!,
      ),
    ],
  ),
];

Future<List<Restaurant>> getRestaurants({
  bool isPopular = false,
  bool isRecommended = false,
  String? categoryId,
  String sortBy = 'rating', // 'rating' or 'minOrder'
}) async {
  if (isPopular) {
    // 평점순으로 정렬하여 상위 4개만 반환
    final sorted = List<Restaurant>.from(dummyRestaurants)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(4).toList();
  } else if (isRecommended) {
    // 리뷰 수로 정렬하여 상위 4개만 반환
    final sorted = List<Restaurant>.from(dummyRestaurants)
      ..sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
    return sorted.take(4).toList();
  } else if (categoryId != null) {
    // 카테고리별로 필터링
    final filtered =
        dummyRestaurants.where((r) => r.categoryId == categoryId).toList();

    // 정렬 기준 적용
    if (sortBy == 'rating') {
      filtered.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (sortBy == 'minOrder') {
      filtered.sort((a, b) => a.minOrderAmount.compareTo(b.minOrderAmount));
    }

    return filtered.take(4).toList();
  } else {
    // 일반 목록은 전체 반환
    return dummyRestaurants;
  }
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
      title: '크리스마스 특별 할인',
      description: '5,000원 할인',
      imageUrl: images[1],
      discountAmount: 5000,
      validUntil: DateTime.now().add(const Duration(days: 7)),
    ),
    Promotion(
      id: 'p3',
      title: '주말 특가 이벤트',
      description: '2만원 이상 주문시 4,000원 할인',
      imageUrl: images[2],
      discountAmount: 4000,
      validUntil: DateTime.now().add(const Duration(days: 14)),
    ),
    Promotion(
      id: 'p4',
      title: '첫 리뷰 이벤트',
      description: '리뷰 작성시 2,000원 할인',
      imageUrl: images[3],
      discountAmount: 2000,
      validUntil: DateTime.now().add(const Duration(days: 60)),
    ),
    Promotion(
      id: 'p5',
      title: '친구 초대 이벤트',
      description: '친구 초대시 3,000원 할인',
      imageUrl: images[4],
      discountAmount: 3000,
      validUntil: DateTime.now().add(const Duration(days: 90)),
    ),
  ];
}
