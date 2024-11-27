class ServerException implements Exception {
  const ServerException([this.message]);

  final dynamic message;

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "ServerException";
    return "ServerException: $message";
  }
}

class ClientException implements Exception {
  const ClientException([this.message]);

  final dynamic message;

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "ClientException";
    return "ClientException: $message";
  }
}

class PostException implements Exception {
  const PostException([this.message]);

  final dynamic message;

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "PostException";
    return "PostException: $message";
  }
}

class CommentException implements Exception {
  const CommentException([this.message]);

  final dynamic message;

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "CommentException";
    return "CommentException: $message";
  }
}
