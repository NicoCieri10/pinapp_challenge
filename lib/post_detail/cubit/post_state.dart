part of 'post_cubit.dart';

enum PostStatus {
  initial,
  loading,
  success,
  error,
}

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.errorMessage = '',
    this.post = const Post(),
    this.comments = const <Comment>[],
  });

  final PostStatus status;
  final String errorMessage;
  final Post post;
  final List<Comment> comments;

  bool get isLoading => status == PostStatus.loading;
  bool get isSuccess => status == PostStatus.success;
  bool get isError => status == PostStatus.error;

  PostState copyWith({
    PostStatus? status,
    String? errorMessage,
    Post? post,
    List<Comment>? comments,
  }) =>
      PostState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        post: post ?? this.post,
        comments: comments ?? this.comments,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        post,
        comments,
      ];
}
