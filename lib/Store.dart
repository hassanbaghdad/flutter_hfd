import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Server.dart';

class Store {


  saveToken(String token) async
  {
    final store = await SharedPreferences.getInstance();
    final key = "token";
    final value = token;
    store.setString(key, value);
  }


  Future<dynamic> getToken() async {
    final store =await SharedPreferences.getInstance();
    final key = "token";
    final value = store.getString(key);
    return value;
  }

  get_login_state() async{
    final store = await SharedPreferences.getInstance();
    final key = "token";
    final token = store.getString(key);

    if(token != null)
    {
     return true;
    }
    return false;
  }

  logout() async{
    final store = await SharedPreferences.getInstance();
    final key = "token";
    store.remove(key);
    final token = store.getString(key);

    if(token != null)
    {
      return true;
    }else{
      return false;

    }
  }



}