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

  Future<void> deletePost(int id) async {
    api.Response res = await api.delete(Uri.parse("$postsURL/$id"));

    if (res.statusCode == 204) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }


  Future createPost({required Map body}) async {
    return api.post(Uri.parse("$postsURL"), body: body).then((api.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return print("TIMM");
    });
  }

}


