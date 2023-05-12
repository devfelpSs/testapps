import 'package:flutter/material.dart';
import 'package:testapp/pages/comments_page.dart';

import '../model/post_model.dart';
import 'package:testapp/repositories/http/posts_http_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var postsRepository = PostsHttpRepository();
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
   posts = await postsRepository.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {
            var post = posts[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (_) => CommentsPage(postId: post.id)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title, 
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
            
                        const SizedBox(
                          height: 10,
                        ),
            
                        Text(
                          post.body, 
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      )
    );
  }
}