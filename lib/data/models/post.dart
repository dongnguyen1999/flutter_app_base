import 'package:equatable/equatable.dart';

class Post extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  Post.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
