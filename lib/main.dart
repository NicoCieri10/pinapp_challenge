import 'package:app_client/app_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:pinapp_challenge/common/common.dart';
import 'package:pinapp_challenge/home/home.dart';
import 'package:pinapp_challenge/routes.dart';

Future<void> main() async {
  runApp(const MyApp());
  await dotenv.load();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AppClientRepository(dioClient: getDioClient()),
      child: MaterialApp.router(
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
        routerConfig: getRouter(context),
      ),
    );
  }

  GoRouter getRouter(BuildContext context) => GoRouter(
        initialLocation: HomePage.route,
        debugLogDiagnostics: true,
        routes: AppRoutes.routes,
      );

  Dio getDioClient() {
    final options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 6),
    );

    return Dio(options)
      ..interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseBody: true,
          responseHeader: false,
        ),
      );
  }
}
