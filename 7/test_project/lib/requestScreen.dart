import 'package:flutter/material.dart';
import 'package:test_project/post_detail.dart';
import 'httpServices.dart';
import 'models/post_model.dart';

class UsersPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            if(posts != null){
              return ListView(
                children: posts
                    .map(
                      (Post post) => ListTile(
                    title: Text(post.first_name),
                    subtitle: Text("${post.email}"),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PostDetail(
                              post: post,
                            ),
                          ),
                        ),
                  ),
                )
                    .toList(),
              );
            } else {
              return const Center(child: LinearProgressIndicator());
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}