import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show debugPrint;

class UnsplashService {
  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey =
      'Kc34SvK-UKfpYu1DggoVhE8SGQWl5wejSPD0PBFjUOY';

  // 카테고리별 기본 이미지 URL 맵
  static const Map<String, String> defaultFoodImages = {
    // 한식
    '순대국밥':
        'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=400',
    '보쌈':
        'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?auto=format&fit=crop&w=400',
    '된장찌개':
        'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?auto=format&fit=crop&w=400',
    '김치찌개':
        'https://images.unsplash.com/photo-1550388342-5699a35584f4?auto=format&fit=crop&w=400',
    '비빔밥':
        'https://images.unsplash.com/photo-1553163147-622ab57be1c7?auto=format&fit=crop&w=400',
    '삼겹살':
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
    '갈비':
        'https://images.unsplash.com/photo-1575932444877-5106bee2a599?auto=format&fit=crop&w=400',
    '불고기':
        'https://images.unsplash.com/photo-1638688569176-d67aa6830436?auto=format&fit=crop&w=400',

    // 중식
    '짜장면':
        'https://images.unsplash.com/photo-1515669097368-22e68427d265?auto=format&fit=crop&w=400',
    '짬뽕':
        'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=400',
    '탕수육':
        'https://images.unsplash.com/photo-1525755662778-989d0524087e?auto=format&fit=crop&w=400',
    '마라탕':
        'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=400',
    '양장피':
        'https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=400',
    '깐풍기':
        'https://images.unsplash.com/photo-1557872943-16a5ac26437e?auto=format&fit=crop&w=400',
    '마파두부':
        'https://images.unsplash.com/photo-1541379889336-70f26e4c4617?auto=format&fit=crop&w=400',
    '양꼬치':
        'https://images.unsplash.com/photo-1555126634-323283e090fa?auto=format&fit=crop&w=400',

    // 일식
    '초밥':
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=400',
    '우동':
        'https://images.unsplash.com/photo-1618841557871-b4664fbf0cb3?auto=format&fit=crop&w=400',
    '라멘':
        'https://images.unsplash.com/photo-1557872943-16a5ac26437e?auto=format&fit=crop&w=400',
    '돈카츠':
        'https://images.unsplash.com/photo-1554502078-ef0fc409efce?auto=format&fit=crop&w=400',
    '규동':
        'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=400',
    '가라아게':
        'https://images.unsplash.com/photo-1584583570840-0a3d88497593?auto=format&fit=crop&w=400',
    '오코노미야키':
        'https://images.unsplash.com/photo-1565192259022-0427b058f372?auto=format&fit=crop&w=400',
    '타코야키':
        'https://images.unsplash.com/photo-1591814468924-caf88d1232e1?auto=format&fit=crop&w=400',

    // 양식
    '파스타':
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=400',
    '스테이크':
        'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=400',
    '피자':
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=400',
    '리조또':
        'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?auto=format&fit=crop&w=400',
    '햄버거':
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=400',
    '샐러드':
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=400',
    '스프':
        'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=400',
    '샌드위치':
        'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?auto=format&fit=crop&w=400',

    // 치킨
    '후라이드치킨':
        'https://images.unsplash.com/photo-1587593810167-a84920ea0781?auto=format&fit=crop&w=400',
    '양념치킨':
        'https://images.unsplash.com/photo-1608039858788-667850f129f5?auto=format&fit=crop&w=400',
    '간장치킨':
        'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?auto=format&fit=crop&w=400',
    '마늘치킨':
        'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?auto=format&fit=crop&w=400',
    '치킨무':
        'https://images.unsplash.com/photo-1597131628347-c769fc631754?auto=format&fit=crop&w=400',
    '치킨버거':
        'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=400',

    // 분식
    '떡볶이':
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
    '김밥':
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',
    '라면':
        'https://images.unsplash.com/photo-1634864572865-1c31d6188187?auto=format&fit=crop&w=400',
    '순대':
        'https://images.unsplash.com/photo-1575932444877-5106bee2a599?auto=format&fit=crop&w=400',
    '튀김':
        'https://images.unsplash.com/photo-1581955957646-b5a446b6100a?auto=format&fit=crop&w=400',
    '어묵':
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',

    // 디저트
    '티라미수':
        'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?auto=format&fit=crop&w=400',
    '망고빙수':
        'https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400',
    '초코케이크':
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=400',
    '치즈케이크':
        'https://images.unsplash.com/photo-1524351199678-941a58a3df50?auto=format&fit=crop&w=400',
    '마카롱':
        'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=400',
    '크로플':
        'https://images.unsplash.com/photo-1596957901846-a0722f546502?auto=format&fit=crop&w=400',
    '와플':
        'https://images.unsplash.com/photo-1513267257196-91eb8b11967b?auto=format&fit=crop&w=400',
    '커피':
        'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400',
    '에이드':
        'https://images.unsplash.com/photo-1437418747212-8d9709afab22?auto=format&fit=crop&w=400',
    '스무디':
        'https://images.unsplash.com/photo-1553530666-ba11a7da3888?auto=format&fit=crop&w=400',

    // 음식점 대표 이미지
    '맛있는 국밥집':
        'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=400',
    '중화반점':
        'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=400',
    '스시히로':
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=400',
    '파스타 공방':
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=400',
    '이모네분식':
        'https://images.unsplash.com/photo-1635963662853-f0ef27c0e0ac?auto=format&fit=crop&w=400',
    '달콤카페':
        'https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=400',
  };

  // API 호출 횟수를 줄이기 위한 영구 캐시
  static final Map<String, String> _imageCache = {};

  static Future<String> getRandomFoodImage({String? query}) async {
    // 1. 캐시 확인
    if (_imageCache.containsKey(query)) {
      return _imageCache[query]!;
    }

    // 2. 기본 이미지 확인
    if (query != null && defaultFoodImages.containsKey(query)) {
      final imageUrl = defaultFoodImages[query]!;
      _imageCache[query] = imageUrl; // 캐시에 저장
      return imageUrl;
    }

    // 3. API 호출 (마지막 수단)
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/photos/random?client_id=$_accessKey&query=${query ?? "food"}&orientation=landscape',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final imageUrl =
            '${data['urls']['regular']}?auto=format&fit=crop&w=400';
        _imageCache[query ?? 'food'] = imageUrl; // 캐시에 저장
        return imageUrl;
      }
    } catch (e) {
      debugPrint('Image loading error for $query: $e');
    }

    // 4. 모든 것이 실패하면 기본 음식 이미지 반환
    return 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400';
  }

  static Future<List<String>> getMultipleFoodImages({
    String? query,
    int count = 5,
  }) async {
    List<String> result = [];

    // 1. 캐시된 이미지 확인
    final cacheKey = '${query ?? "food"}_$count';
    if (_imageCache.containsKey(cacheKey)) {
      final cachedUrls = _imageCache[cacheKey]!.split(',');
      if (cachedUrls.length >= count) {
        return cachedUrls.take(count).toList();
      }
    }

    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/photos/random?client_id=$_accessKey&query=${query ?? "food"}&count=$count&orientation=landscape',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        result = data
            .map((item) =>
                '${item['urls']['regular']}?auto=format&fit=crop&w=400')
            .toList();

        // 결과를 캐시에 저장
        _imageCache[cacheKey] = result.join(',');
        return result;
      }
    } catch (e) {
      debugPrint('Multiple images loading error for $query: $e');
    }

    // 실패시 기본 이미지 반환
    return List.generate(
      count,
      (index) =>
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
    );
  }
}
