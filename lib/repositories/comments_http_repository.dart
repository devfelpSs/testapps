import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapp/model/comment_model.dart';

class CommentsHttpRepository {

  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200){
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
      .map((e) => CommentModel.fromJson(e))
      .toList();
    }
    return [];
  }
  
}