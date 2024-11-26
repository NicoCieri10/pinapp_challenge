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
      builder: (context, state) => PostDetailPage(key: state.pageKey),
    ),
  ];
}
