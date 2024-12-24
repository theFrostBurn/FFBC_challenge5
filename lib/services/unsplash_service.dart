import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashService {
  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey =
      'Kc34SvK-UKfpYu1DggoVhE8SGQWl5wejSPD0PBFjUOY';

  // 카테고리별 기본 이미지 URL 맵
  static const Map<String, String> _defaultFoodImages = {
    '순대국밥': 'https://images.unsplash.com/photo-1547592180-85f173990554?w=400',
    '국밥': 'https://images.unsplash.com/photo-1547592180-85f173990554?w=400',
    '쌀밥': 'https://images.unsplash.com/photo-1574484284002-952d92456975?w=400',
    '짬뽕': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400',
    '짜장면': 'https://images.unsplash.com/photo-1534422298391-e4f8c172789a?w=400',
    '탕수육': 'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=400',
    '토스트': 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=400',
    '떡볶이': 'https://images.unsplash.com/photo-1635963662853-f0ef27c0e0ac?w=400',
    '튀김': 'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=400',
    // 추가 메뉴들의 기본 이미지
    '치킨': 'https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=400',
    '피자': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400',
    '스시': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400',
    '파스타': 'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=400',
    '햄버거': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
    '샐러드': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
    '커피': 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400',
    '디저트': 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400',
  };

  // API 호출 횟수를 줄이기 위한 캐시
  static final Map<String, String> _imageCache = {};

  static Future<String> getRandomFoodImage({String? query}) async {
    // 1. 캐시 확인
    if (_imageCache.containsKey(query)) {
      return _imageCache[query]!;
    }

    // 2. 기본 이미지 확인
    if (query != null && _defaultFoodImages.containsKey(query)) {
      return _defaultFoodImages[query]!;
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
        final imageUrl = '${data['urls']['regular']}?w=400'; // 이미지 크기 최적화
        _imageCache[query ?? 'food'] = imageUrl; // 캐시에 저장
        return imageUrl;
      }
    } catch (e) {
      print('Image loading error for $query: $e');
    }

    // 4. 모든 것이 실패하면 기본 음식 이미지 반환
    return 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400';
  }

  static Future<List<String>> getMultipleFoodImages({
    String? query,
    int count = 5,
  }) async {
    try {
      // 캐시된 이미지 URL들을 우선 사용
      if (query != null && _defaultFoodImages.containsKey(query)) {
        return List.generate(count, (index) => _defaultFoodImages[query]!);
      }

      final response = await http.get(
        Uri.parse(
          '$_baseUrl/photos/random?client_id=$_accessKey&query=${query ?? "food"}&count=$count&orientation=landscape',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => '${item['urls']['regular']}?w=400').toList();
      }
    } catch (e) {
      print('Multiple images loading error for $query: $e');
    }

    // 카테고리별 대체 이미지 맵
    final Map<String, List<String>> fallbackImages = {
      'korean': [
        'https://images.unsplash.com/photo-1580651315530-69c8e0026377?w=400',
        'https://images.unsplash.com/photo-1583187855495-d1f6a535a239?w=400',
        'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=400',
        'https://images.unsplash.com/photo-1547592180-85f173990554?w=400',
        'https://images.unsplash.com/photo-1574484284002-952d92456975?w=400',
      ],
      'chinese': [
        'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400',
        'https://images.unsplash.com/photo-1534422298391-e4f8c172789a?w=400',
        'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=400',
        'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400',
        'https://images.unsplash.com/photo-1571167366136-b57e07761625?w=400',
      ],
      'japanese': [
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400',
        'https://images.unsplash.com/photo-1553621042-f6e147245754?w=400',
        'https://images.unsplash.com/photo-1554502078-ef0fc409efce?w=400',
        'https://images.unsplash.com/photo-1559410545-0bdcd187e0a6?w=400',
        'https://images.unsplash.com/photo-1540648639573-8c848de23f0a?w=400',
      ],
      'western': [
        'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=400',
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400',
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400',
        'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?w=400',
      ],
      'default': [
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400',
        'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=400',
        'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?w=400',
        'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=400',
      ],
    };

    // 쿼리에 따른 적절한 대체 이미지 리스트 선택
    List<String> fallbackList = fallbackImages['default']!;
    if (query != null) {
      if (query.contains('한식') || query.contains('korean')) {
        fallbackList = fallbackImages['korean']!;
      } else if (query.contains('중식') || query.contains('chinese')) {
        fallbackList = fallbackImages['chinese']!;
      } else if (query.contains('일식') || query.contains('japanese')) {
        fallbackList = fallbackImages['japanese']!;
      } else if (query.contains('양식') || query.contains('western')) {
        fallbackList = fallbackImages['western']!;
      }
    }

    // 요청된 개수만큼 대체 이미지 반환 (순환하면서)
    return List.generate(
      count,
      (index) => fallbackList[index % fallbackList.length],
    );
  }
}
