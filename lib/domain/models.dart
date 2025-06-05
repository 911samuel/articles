class Post {
  final String? image;
  final String? title;
  final String? description;
  final String? date;

  Post({this.image, this.title, this.description, this.date});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      image: json['urlToImage'] as String?, 
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['publishedAt'] as String?, 
    );
  }
}
