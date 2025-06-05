import 'dart:io';

import 'package:articles/data/repositories/post_repository.dart';
import 'package:articles/domain/models.dart';
import 'package:flutter/foundation.dart';

class PostsViewModal extends ChangeNotifier {
  PostsViewModal(this._repository);
  final PostRepository _repository;

  List<Post> _posts = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _posts = await _repository.fetchPosts();
    } on SocketException {
      _errorMessage = 'No internet connection';
    } on HttpException {
      _errorMessage = 'Could not fetch posts';
    } on FormatException {
      _errorMessage = 'Bad response format';
    } catch (e) {
      _errorMessage = 'Failed to load posts: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
