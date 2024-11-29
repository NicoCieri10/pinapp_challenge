import 'dart:async';

import 'package:app_client/app_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required AppClientRepository repository})
      : _repository = repository,
        super(const HomeState()) {
    init();
  }

  final AppClientRepository _repository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final posts = await _repository.getAllPosts();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          posts: posts,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
