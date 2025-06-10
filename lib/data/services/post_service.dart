import 'dart:convert';
import 'package:articles/domain/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostService {
  final String baseUrl = dotenv.env['API_BASE_URL'] ?? 'https://api.example.com';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('\$baseUrl/posts'),
      headers: {
        'Authorization': 'Bearer ${dotenv.env['API_KEY'] ?? ''}',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = data['articles'] as List;
      return articles.map((article) => Post.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load posts: ${response.statusCode}');
    }
  }
}
