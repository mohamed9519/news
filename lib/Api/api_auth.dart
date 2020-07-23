import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/author.dart';
import 'dart:convert';

import 'package:news_app/utilities/api_authors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiAuth{
  Future<bool> login(String email , String password ) async{
    String api_auth= base_api + auth_api;
    Map<String, String> headers = {
      "Accept" : "application/json",
      "Content-Type" : "application/x-www-form-urlencoded"

    };
    Map<String , String> body = {
      "email": email,
      "password":password
    };
    var response = await http.post(api_auth,headers: headers, body: body);
    if( response.statusCode == 200 ){
      try{
        var jsonData = jsonDecode( response.body);
        var data = jsonData['data'];
        var token = data['token'];
        WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("token", token);
        return true;
      }catch( Exception ){
        return false;
      }

    }

    return false;
  }

}
