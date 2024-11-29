import 'package:app_client/app_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required AppClientRepository repository})
      : _repository = repository,
        super(const PostState());

  final AppClientRepository _repository;

  Future<void> init({required Post post}) async {
    try {
      emit(state.copyWith(status: PostStatus.loading));

      final postId = post.id;

      if (postId == null) throw Exception('postId null');

      final comments = await _repository.getAllCommentsById(postId: postId);

      emit(
        state.copyWith(
          status: PostStatus.success,
          post: post,
          comments: comments,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PostStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
