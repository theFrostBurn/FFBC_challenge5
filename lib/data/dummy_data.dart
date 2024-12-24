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
    // 한식 (c1)
    Restaurant(
      id: 'r1',
      name: '할매 순대국',
      categoryId: 'c1',
      imageUrl: topImages[0],
      rating: 4.8,
      deliveryTime: '15-25분',
      minOrderAmount: 9000,
      menuItems: ['순대국밥', '내장국밥', '공기밥'],
    ),
    Restaurant(
      id: 'r2',
      name: '원조 감자탕',
      categoryId: 'c1',
      imageUrl: topImages[1],
      rating: 4.7,
      deliveryTime: '20-30분',
      minOrderAmount: 18000,
      menuItems: ['감자탕', '뼈해장국', '콩나물국밥'],
    ),
    Restaurant(
      id: 'r3',
      name: '청진동 돈까스',
      categoryId: 'c1',
      imageUrl: topImages[2],
      rating: 4.6,
      deliveryTime: '25-35분',
      minOrderAmount: 12000,
      menuItems: ['돈까스', '치즈돈까스', '카레돈까스'],
    ),

    // 중식 (c2)
    Restaurant(
      id: 'r4',
      name: '황금 짬뽕',
      categoryId: 'c2',
      imageUrl: topImages[3],
      rating: 4.8,
      deliveryTime: '20-30분',
      minOrderAmount: 16000,
      menuItems: ['짬뽕', '짜장면', '탕수육'],
    ),
    Restaurant(
      id: 'r5',
      name: '대명 마라탕',
      categoryId: 'c2',
      imageUrl: topImages[4],
      rating: 4.7,
      deliveryTime: '25-35분',
      minOrderAmount: 15000,
      menuItems: ['마라탕', '마라샹궈', '꿔바로우'],
    ),
    Restaurant(
      id: 'r6',
      name: '취향저격 양꼬치',
      categoryId: 'c2',
      imageUrl: topImages[5],
      rating: 4.6,
      deliveryTime: '30-40분',
      minOrderAmount: 20000,
      menuItems: ['양꼬치', '마라양꼬치', '꿔바로우'],
    ),

    // 일식 (c3)
    Restaurant(
      id: 'r7',
      name: '미소 스시',
      categoryId: 'c3',
      imageUrl: topImages[6],
      rating: 4.9,
      deliveryTime: '20-30분',
      minOrderAmount: 20000,
      menuItems: ['모듬 스시', '연어 스시', '우동'],
    ),
    Restaurant(
      id: 'r8',
      name: '사쿠라 라멘',
      categoryId: 'c3',
      imageUrl: topImages[7],
      rating: 4.7,
      deliveryTime: '15-25분',
      minOrderAmount: 11000,
      menuItems: ['돈코츠라멘', '미소라멘', '교자'],
    ),
    Restaurant(
      id: 'r9',
      name: '돈카츠 이치방',
      categoryId: 'c3',
      imageUrl: topImages[8],
      rating: 4.6,
      deliveryTime: '25-35분',
      minOrderAmount: 13000,
      menuItems: ['돈카츠', '치즈카츠', '카레'],
    ),

    // 양식 (c4)
    Restaurant(
      id: 'r10',
      name: '마마 파스타',
      categoryId: 'c4',
      imageUrl: topImages[9],
      rating: 4.8,
      deliveryTime: '25-35분',
      minOrderAmount: 13000,
      menuItems: ['까르보나라', '알리오올리오', '토마토 파스타'],
    ),
    Restaurant(
      id: 'r11',
      name: '빅벨리 버거',
      categoryId: 'c4',
      imageUrl: topImages[10],
      rating: 4.7,
      deliveryTime: '20-30분',
      minOrderAmount: 12000,
      menuItems: ['치즈버거', '베이컨버거', '감자튀김'],
    ),
    Restaurant(
      id: 'r12',
      name: '스테이크 하우스',
      categoryId: 'c4',
      imageUrl: topImages[11],
      rating: 4.9,
      deliveryTime: '30-40분',
      minOrderAmount: 25000,
      menuItems: ['립아이 스테이크', '안심 스테이크', '샐러드'],
    ),

    // 치킨 (c5)
    Restaurant(
      id: 'r13',
      name: '크런치 치킨 공방',
      categoryId: 'c5',
      imageUrl: topImages[12],
      rating: 4.7,
      deliveryTime: '30-40분',
      minOrderAmount: 15000,
      menuItems: ['후라이드 치킨', '양념 치킨', '간장 치킨'],
    ),
    Restaurant(
      id: 'r14',
      name: '굽네 치킨',
      categoryId: 'c5',
      imageUrl: topImages[13],
      rating: 4.6,
      deliveryTime: '35-45분',
      minOrderAmount: 16000,
      menuItems: ['오븐 치킨', '고추바사삭', '볼케이노'],
    ),
    Restaurant(
      id: 'r15',
      name: '교촌 치킨',
      categoryId: 'c5',
      imageUrl: topImages[14],
      rating: 4.8,
      deliveryTime: '30-40분',
      minOrderAmount: 17000,
      menuItems: ['허니콤보', '레드콤보', '살살치킨'],
    ),

    // 피자 (c6)
    Restaurant(
      id: 'r16',
      name: '피자 파라다이스',
      categoryId: 'c6',
      imageUrl: topImages[15],
      rating: 4.4,
      deliveryTime: '30-40분',
      minOrderAmount: 18000,
      menuItems: ['페퍼로니 피자', '치즈 피자', '포테이토 피자'],
    ),
    Restaurant(
      id: 'r17',
      name: '도미노 피자',
      categoryId: 'c6',
      imageUrl: topImages[16],
      rating: 4.5,
      deliveryTime: '30-40분',
      minOrderAmount: 19000,
      menuItems: ['슈퍼디럭스', '포테이토', '베이컨체더치즈'],
    ),
    Restaurant(
      id: 'r18',
      name: '피자스쿨',
      categoryId: 'c6',
      imageUrl: topImages[17],
      rating: 4.3,
      deliveryTime: '20-30분',
      minOrderAmount: 15000,
      menuItems: ['베이직치즈', '페퍼로니', '하와이안'],
    ),

    // 분식 (c7)
    Restaurant(
      id: 'r19',
      name: '달인의 김밥천국',
      categoryId: 'c7',
      imageUrl: topImages[18],
      rating: 4.5,
      deliveryTime: '15-25분',
      minOrderAmount: 12000,
      menuItems: ['김밥', '라면', '떡볶이'],
    ),
    Restaurant(
      id: 'r20',
      name: '죠스 떡볶이',
      categoryId: 'c7',
      imageUrl: topImages[19],
      rating: 4.6,
      deliveryTime: '15-25분',
      minOrderAmount: 11000,
      menuItems: ['떡볶이', '순대', '튀김'],
    ),
    Restaurant(
      id: 'r21',
      name: '동대문 엽기떡볶이',
      categoryId: 'c7',
      imageUrl: topImages[20],
      rating: 4.7,
      deliveryTime: '20-30분',
      minOrderAmount: 13000,
      menuItems: ['엽기떡볶이', '엽기오뎅', '주먹김밥'],
    ),

    // 디저트 (c8)
    Restaurant(
      id: 'r22',
      name: '달콤 디저트',
      categoryId: 'c8',
      imageUrl: topImages[21],
      rating: 4.7,
      deliveryTime: '20-30분',
      minOrderAmount: 15000,
      menuItems: ['티라미수', '초코케이크', '마카롱'],
    ),
    Restaurant(
      id: 'r23',
      name: '설빙',
      categoryId: 'c8',
      imageUrl: topImages[22],
      rating: 4.5,
      deliveryTime: '15-25분',
      minOrderAmount: 12000,
      menuItems: ['인절미설빙', '망고설빙', '초코설빙'],
    ),
    Restaurant(
      id: 'r24',
      name: '파리바게뜨',
      categoryId: 'c8',
      imageUrl: topImages[23],
      rating: 4.4,
      deliveryTime: '20-30분',
      minOrderAmount: 10000,
      menuItems: ['케이크', '빵', '샌드위치'],
    ),
  ];

  // 실시간 주문용 음식점 목록도 동일한 구조로 구현...
  final List<Restaurant> trendingRestaurants = [
    // ... 위와 비슷한 구조로 24개의 음식점 구현
    // 단, 다른 이미지(trendingImages)와 약간 다른 평점/메뉴 사용
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
