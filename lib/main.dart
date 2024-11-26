import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinapp_challenge/home/home.dart';
import 'package:pinapp_challenge/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = goRouter(context);

    return MaterialApp.router(
      title: 'PinApp Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00B9E8),
          primary: const Color(0xFF00B9E8),
          secondary: const Color(0xFFF50000),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }

  GoRouter goRouter(BuildContext context) {
    return GoRouter(
      initialLocation: HomePage.route,
      debugLogDiagnostics: true,
      routes: AppRoutes.routes,
    );
  }
}
