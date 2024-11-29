part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.errorMessage = '',
    this.posts = const <Post>[],
  });

  final HomeStatus status;
  final String errorMessage;
  final List<Post> posts;

  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isError => status == HomeStatus.error;

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    List<Post>? posts,
  }) =>
      HomeState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        posts: posts ?? this.posts,
      );

  @override
  List<Object> get props => [
        status,
        errorMessage,
        posts,
      ];
}
