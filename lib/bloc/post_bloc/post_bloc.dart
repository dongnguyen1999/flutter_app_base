import 'dart:async';

import 'package:app_base/data/models/post.dart';
import 'package:app_base/data/repository/post_repository.dart';
import 'package:app_base/data/source/network/api_result_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late PostRepository postRepository;

  PostBloc() : super(PostInitial()) {
    postRepository = PostRepository();
    on<GetPost>(_onGetPost);
    on<ResetPost>(_onResetPost);
    on<GetPostFail>(_onGetPostFail);
  }

  void _onGetPost(GetPost event, Emitter<PostState> emit) async {
    emit(GetPostLoading());
    await Future.delayed(const Duration(seconds: 1));
    final response = await postRepository.getPost(event.id);
    if (response is ApiSuccess) {
      emit(GetPostSuccess(Post.fromJson(response.data)));
    } else if (response is ApiFailure) {
      emit(GetPostError(response.message));
    }
  }

  void _onResetPost(ResetPost event, Emitter<PostState> emit) {
    emit(PostInitial());
  }

  void _onGetPostFail(GetPostFail event, Emitter<PostState> emit) async {
    emit(GetPostLoading());
    await Future.delayed(const Duration(seconds: 1));
    final response = await postRepository.getPostFail();
    if (response is ApiSuccess) {
      emit(GetPostSuccess(Post.fromJson(response.data)));
    } else if (response is ApiFailure) {
      emit(GetPostError(response.message));
    }
  }
}
