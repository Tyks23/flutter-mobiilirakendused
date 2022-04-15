import 'package:flutter/material.dart';
import 'models/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.first_name + " " + post.last_name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                       CircleAvatar(
                          backgroundImage: NetworkImage(post.avatar),
                          radius: 50.0
                      ),
                      ListTile(
                        title: Text("Name"),
                        subtitle: Text(post.first_name + " " + post.last_name),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${post.id}"),
                      ),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text(post.email),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}