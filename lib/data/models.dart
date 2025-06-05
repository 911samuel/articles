import 'package:articles/domain/models.dart';

class PostDataModel {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? publishedAt;

  PostDataModel({
    this.imageUrl,
    this.title,
    this.description,
    this.publishedAt,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
      imageUrl: json['urlToImage'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );
  }

  Post toDomain() {
    return Post(
      image: imageUrl,
      title: title,
      description: description,
      date: publishedAt,
    );
  }
}
