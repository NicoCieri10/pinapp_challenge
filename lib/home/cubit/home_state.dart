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
    this.posts = const <Post>[],
    this.errorMessage = '',
  });

  final HomeStatus status;
  final List<Post> posts;
  final String errorMessage;

  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isError => status == HomeStatus.error;

  HomeState copyWith({
    HomeStatus? status,
    List<Post>? posts,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        posts,
        errorMessage,
      ];
}
