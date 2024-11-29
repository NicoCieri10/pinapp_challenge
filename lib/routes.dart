import 'package:app_client/app_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinapp_challenge/home/home.dart';
import 'package:pinapp_challenge/post_detail/post_detail.dart';

class AppRoutes {
  const AppRoutes._();

  static final routes = [
    GoRoute(
      path: HomePage.route,
      name: HomePage.route,
      builder: (context, state) => HomePage(key: state.pageKey),
    ),
    GoRoute(
      path: PostDetailPage.route,
      name: PostDetailPage.route,
      pageBuilder: (context, state) {
        final post = state.extra as Post?;

        if (post == null) throw Exception('PostDetailPage router - Post null ');

        return CustomTransitionPage(
          key: state.pageKey,
          child: PostDetailPage(
            key: state.pageKey,
            post: post,
          ),
          transitionsBuilder: _getTransition,
        );
      },
    ),
  ];
}

Widget _getTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> animation2,
  Widget child,
) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
