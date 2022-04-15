import 'dart:convert';
import 'package:http/http.dart' as api;
import 'models/post_model.dart';

class HttpService {
  final String postsURL = "https://reqres.in/api/users";

  Future<List<Post>> getPosts() async {
    api.Response res = await api.get(Uri.parse(postsURL));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)["data"];
      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

}