import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String avatar;

  Post({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.avatar,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );
  }
}