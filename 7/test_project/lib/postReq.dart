import 'package:flutter/material.dart';
import 'httpServices.dart';

class Post2 {
  final String name;
  final String job;

  Post2({required this.name, required this.job});

  factory Post2.fromJson(Map json) {
    return Post2(
      name: json['name'],
      job: json['job'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["name"] = name;
    map["job"] = job;

    return map;
  }
}



class PostReq extends StatelessWidget {
  late final Future post;
  final HttpService httpService = HttpService();


  // PostReq({required Key key, required this.post}) : super(key: key);

  TextEditingController titleControler = new TextEditingController();
  TextEditingController bodyControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("POST")
        ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              children: [
                new TextField(
                  controller: titleControler,
                  decoration: InputDecoration(
                      hintText: "name....", labelText: 'Name'),
                ),
                new TextField(
                  controller: bodyControler,
                  decoration: InputDecoration(
                      hintText: "job....", labelText: 'Job'),
                ),
                new RaisedButton(
                  onPressed: () async {
                    Post2 newPost = new Post2(
                        name: titleControler.text, job: bodyControler.text);
                     await httpService.createPost(
                        body: newPost.toMap());
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          ));
  }
}