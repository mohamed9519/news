import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/model/psot.dart';
import 'package:news_app/utilities/api_authors.dart';

class ApiPost {
  Future<List<Post>> fetchCategoryByID(String id) async {
    List<Post> posts = List<Post>();
    String PostApi = base_api + post_api +id;
    var response = await http.get(PostApi);
    if (response.statusCode == 200) {
      var Jsondata = jsonDecode(response.body);
      var data = Jsondata["data"];
      for (var item in data) {
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"].toString(),
            featuredImage: item["featured_image"].toString(),
            voteUP: item["vote_up"],
            voteDown: item["vote_down"],
            voterUp: (item["voters_up"] == null)
                ? List<int>()
                : jsonDecode(item["voters_up"]),
            voterDown: (item["voters_down"] == null)
                ? List<int>()
                : jsonDecode(item["voters_down"]),
            userId: item["user_id"],
            categoryId: item["category_id"]);
        posts.add(post);
      }
    }
    return posts;
  }


}
