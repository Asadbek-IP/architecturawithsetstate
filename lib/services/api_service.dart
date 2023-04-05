import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/post.dart';

class ApiService {
  static final dio = Dio();

  static Future<List<Post>> getAllPost() async {
    final response = await dio.get(
      "https://jsonplaceholder.typicode.com/posts",
    );
    return parsingPost(response.data);
  }

  static Future<Post> createPost(Post post) async {
    final response =
        await dio.post("https://jsonplaceholder.typicode.com/posts",
            data: jsonEncode(post.toMap()),
            options: Options(headers: {
              'Content-type': 'application/json; charset=UTF-8',
            }));
    return Post.fromMap(response.data);
  }

  static Future<Post> putPost(Post post) async {
    final response =
        await dio.put("https://jsonplaceholder.typicode.com/posts/${post.id}",
            data: jsonEncode(post.toMap()),
            options: Options(headers: {
              'Content-type': 'application/json; charset=UTF-8',
            }));
    return Post.fromMap(response.data);
  }
}
