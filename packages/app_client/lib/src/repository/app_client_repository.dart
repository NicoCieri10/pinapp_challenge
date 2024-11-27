import 'package:dio/dio.dart';

/// The JSON serializable model for the API response.
typedef JSON = Map<String, dynamic>;

/// When de API response is a List of [JSON].
typedef JSONLIST = List<JSON>;

/// APP Client to manage the API requests.
class AppClientRepository {
  /// Class constructor
  AppClientRepository({required Dio dioClient}) : _dio = dioClient;

  /// Dio instance
  final Dio _dio;

  /// The post's path for the queries.
  static const postsPath = '/posts';

  /// The comment's path for the queries.
  static const commentsPath = '/comments';
}
