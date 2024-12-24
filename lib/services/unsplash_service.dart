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

    // 일식
    '초밥':
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=400',
    '우동':
        'https://images.unsplash.com/photo-1618841557871-b4664fbf0cb3?auto=format&fit=crop&w=400',
    '라멘':
        'https://images.unsplash.com/photo-1557872943-16a5ac26437e?auto=format&fit=crop&w=400',
    '돈카츠':
        'https://images.unsplash.com/photo-1554502078-ef0fc409efce?auto=format&fit=crop&w=400',

    // 양식
    '파스타':
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=400',
    '스테이크':
        'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=400',
    '피자':
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=400',

    // 치킨
    '후라이드치킨':
        'https://images.unsplash.com/photo-1587593810167-a84920ea0781?auto=format&fit=crop&w=400',
    '양념치킨':
        'https://images.unsplash.com/photo-1608039858788-667850f129f5?auto=format&fit=crop&w=400',

    // 분식
    '떡볶이':
        'https://images.unsplash.com/photo-1635963662853-f0ef27c0e0ac?auto=format&fit=crop&w=400',
    '김밥':
        'https://images.unsplash.com/photo-1590301157890-4810ed352733?auto=format&fit=crop&w=400',

    // 디저트
    '티라미수':
        'https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=400',
    '망고빙수':
        'https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400',

    // 음식점 대표 이미지
    '맛있는 국밥집':
        'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=400',
    '중화반점':
        'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?auto=format&fit=crop&w=400',
    '스시히로':
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=400',
    '파스타 공방':
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=400',
    '바삭치킨':
        'https://images.unsplash.com/photo-1587593810167-a84920ea0781?auto=format&fit=crop&w=400',
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
