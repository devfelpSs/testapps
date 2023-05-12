import 'package:testapp/model/post_model.dart';

import 'posts_repository.dart';

class PostsDioRepository implements PostsRepository{
  @override
  Future<List<PostModel>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
  
}