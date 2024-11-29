import 'package:app_client/app_client.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    required this.post,
    super.key,
  });

  static const route = '/post-detail';

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(post.title ?? ''),
      ),
    );
  }
}
