class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory Post.fromMap(Map<String, dynamic>? json) => Post(
        userId: json?['userId'],
        id: json?['id'],
        title: json?['title'],
        body: json?['body'],
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
