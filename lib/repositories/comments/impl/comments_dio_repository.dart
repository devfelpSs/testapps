import 'package:dio/dio.dart';
import 'package:testapp/model/comment_model.dart';
import 'package:testapp/repositories/comments/comments_repository.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
  
}