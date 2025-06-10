import 'dart:convert';
import 'package:articles/domain/models.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=apple&from=2025-05-19&to=2025-05-19&sortBy=popularity&apiKey=137dee1cfd874df88413635ec5406229',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        return articles.map((article) => Post.fromJson(article)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
