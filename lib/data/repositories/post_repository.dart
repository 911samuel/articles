import 'package:articles/data/services/post_service.dart';
import 'package:articles/domain/models.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}

class PostRepositoryImpl implements PostRepository {
  final PostService _postService;

  PostRepositoryImpl(this._postService);

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      return await _postService.fetchPosts();
    } catch (e) {
      rethrow;
    }
  }
}
