import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testapp/model/post_model.dart';

import 'posts_repository.dart';

class PostsDioRepository implements PostsRepository{
  @override
  Future<List<PostModel>> getPosts() async {
    var dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts/");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
  
}