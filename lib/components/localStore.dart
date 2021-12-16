import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Server.dart';
class LocalStore extends ChangeNotifier{
  int countAnswers = 0 ;

 getAnswersCount() async{
    try{
      SharedPreferences shared = await SharedPreferences.getInstance();
      String _qi = "";
      _qi =  shared.getString('myqi')!;
      var url =Server.con + "/api-mobile/services/get-complaints-soldier";
      var response = await http.post(Uri.parse(url),body: jsonEncode(<String, dynamic>{
        'qi':_qi
      }),headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);
      if(response.statusCode==200)
      {
        var res = jsonDecode(response.body);
        print(res);
        countAnswers = res;
        print('count: $countAnswers');
        notifyListeners();
      }else{
        var res = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: res["msg"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18,
        );
      }

    }catch(e){
      print(e);
    }finally{

    }
    notifyListeners();
  }
}