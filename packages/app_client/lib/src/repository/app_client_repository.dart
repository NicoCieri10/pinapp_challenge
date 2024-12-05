import 'dart:developer';

import 'package:app_client/app_client.dart';
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
  static const _postsPath = '/posts';

  /// The comment's path for the queries.
  static const _commentsPath = '/comments';

  final _options = Options(validateStatus: (_) => true);

  Future<List<Post>> getAllPosts() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        _postsPath,
        options: _options,
      );

      if (response.statusCode! >= 500) throw const ServerException();

      if (response.statusCode != 200) throw const ClientException();

      final data = (response.data as List<dynamic>)
          .cast<Map<dynamic, dynamic>?>()
          .map((e) => e?.cast<String, dynamic>())
          .toList();

      return data.map(Post.fromMap).toList();
    } on ServerException catch (e) {
      log(e.toString());
      return [];
    } on ClientException catch (e) {
      log(e.toString());
      return [];
    } catch (e) {
      log(e.toString());
      throw PostModelException(e);
    }
  }

  Future<List<Comment>> getAllCommentsById({required int postId}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        _commentsPath,
        options: _options,
        queryParameters: {'postId': postId},
      );

      if (response.statusCode! >= 500) throw const ServerException();

      if (response.statusCode != 200) throw const ClientException();

      final data = (response.data as List<dynamic>)
          .cast<Map<dynamic, dynamic>?>()
          .map((e) => e?.cast<String, dynamic>())
          .toList();

      return data.map(Comment.fromMap).toList();
    } on ServerException catch (e) {
      log(e.toString());
      return [];
    } on ClientException catch (e) {
      log(e.toString());
      return [];
    } catch (e) {
      throw CommentModelException(e);
    }
  }
}
