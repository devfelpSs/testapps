import 'package:flutter/material.dart';
import 'package:testapp/repositories/comments_repository.dart';

import '../model/comment_model.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var commentsRepository = CommentsRepository();
  var comments = <CommentModel>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornaComentarios(widget.postId);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: Text("Comentários do Post: ${widget.postId}"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (_, int index){
            var comment = comments[index];
            return Container(
              child: Text(comment.body),
            );
          }
        )),
      )
    );
  }
}