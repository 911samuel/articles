import 'dart:convert';
import 'package:articles/domain/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:articles/core/const/constants.dart';

class PostService {
  Future<List<Post>> fetchPosts() async {
    final apiKey = dotenv.env['API_KEY'] ?? '';
    final url = Uri.parse('${Constants.baseUrl}&apiKey=$apiKey');

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
