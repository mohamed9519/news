import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/model/category.dart';
import 'package:news_app/utilities/api_authors.dart';

class ApiCategory{

  Future <List<Category>> fetchCategory() async{
    List<Category> categories = List<Category>();

    String CategoryUrl=  base_api + categoary_api;
    var response = await http.get(CategoryUrl);
    if(response.statusCode==200){
      var Jsondata = jsonDecode(response.body);
      var data = Jsondata["data"];
      for(var item in data){
        Category category = Category(item["id"].toString(), item["title"].toString());
        categories.add(category);
        print(category.title);
      }
    }
    return categories;

  }

}