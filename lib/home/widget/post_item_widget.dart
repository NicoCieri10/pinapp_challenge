import 'package:app_client/app_client.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinapp_challenge/post_detail/post_detail.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    void onTap() => context.pushNamed(
          PostDetailPage.route,
          extra: post,
        );

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height * 0.3,
        child: Column(
          children: [
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title ?? 'title',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    post.body ?? 'body',
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}
