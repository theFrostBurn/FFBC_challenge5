import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashService {
  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey =
      'Kc34SvK-UKfpYu1DggoVhE8SGQWl5wejSPD0PBFjUOY';

  static Future<String> getRandomFoodImage({String? query}) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/photos/random?client_id=$_accessKey&query=${query ?? "food"}&orientation=landscape',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['urls']['regular'];
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<List<String>> getMultipleFoodImages({
    String? query,
    int count = 5,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/photos/random?client_id=$_accessKey&query=${query ?? "food"}&count=$count&orientation=landscape',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => item['urls']['regular'] as String).toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
