import 'package:flutter/material.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '.././Store.dart';

class Posts{
  var token = Store().getToken();
  get_posts() async{
    print("geting");
    var url =Server.con+"/api/0x07/posts/get-posts";
    print(url);
    var response = await http.post(Uri.parse(url),body: jsonEncode(<String, String>{
      'Authorization': 'Bearer $token',

    }),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    var data = jsonDecode(response.body);
    return data;
  }
}