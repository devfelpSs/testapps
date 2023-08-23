
import 'package:testapp/model/post_model.dart';

import '../../jsonplaceholder_custom_dio.dart';
import 'posts_repository.dart';

class PostsDioRepository implements PostsRepository{
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio.get("/posts/");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
  
}