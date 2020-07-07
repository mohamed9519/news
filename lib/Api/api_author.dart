import 'package:http/http.dart' as http;
import 'package:news_app/model/author.dart';
import 'dart:convert';

import 'package:news_app/utilities/api_authors.dart';

class ApiAuthor {
  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = List<Author>();
    String allauthorApi = base_api + all_authors_api;
    var response = await http.get(allauthorApi);

    if (response.statusCode == 200) {
      var Jsondata = jsonDecode(response.body);
      var data = Jsondata["data"];

      for (var item in data) {
        Author author = Author(item["id"].toString(), item["title"].toString(),
            item["email"].toString(), item["avatar"].toString());
        authors.add(author);
        print(author.email);
      }
    }

    return authors;
  }
}
