part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class GetPostLoading extends PostState {}

class GetPostSuccess extends PostState {
  final Post post;

  GetPostSuccess(this.post);
}

class GetPostError extends PostState {
  final String errorMessage;

  GetPostError(this.errorMessage);
}
