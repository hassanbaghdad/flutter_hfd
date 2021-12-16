import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hfd_flutter/Colors/myColors.dart';
import 'package:hfd_flutter/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Server.dart';

class Answers extends StatefulWidget {
  const Answers({Key? key}) : super(key: key);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  @override
  Widget build(BuildContext context) {

   // getQi();
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("الردود"),
        backgroundColor: MyColors().primary,
      ),
      body: Container(
        child: FutureBuilder(
          future:getAnswers(),
          builder: (BuildContext context , AsyncSnapshot snapshot){
            if(snapshot.hasData)
            {
              return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context ,i){
                if(snapshot.data[i]['complaint_answer'] != null)
                  {
                    return Column(
                      children: [
                        Divider(thickness: 1,),
                        ListTile(
                          title: Text("${snapshot.data[i]['complaint_answer']}"),
                          leading: Icon(Icons.email),
                          subtitle: Text("${snapshot.data[i]['complaint_date'].toString().substring(0,10)}"),
                          trailing: snapshot.data[i]['answer_has_seen'] ==0 ?Icon(Icons.circle,color: Colors.red,size: 20,):SizedBox(),
                          onTap: (){},
                        ),
                        Divider(thickness: 1,),
                      ],);
                  }
                return SizedBox();
              });
            }
              return Center(child: CircularProgressIndicator(color: MyColors().primary,),);

          },
        )

      ),
    ));

  }

  getAnswers() async{
    try{
      SharedPreferences shared = await SharedPreferences.getInstance();
      String _qi = "";
      _qi =  shared.getString('myqi')!;

      var url =Server.con + "/api-site/services/get-complaints-soldier";
      var response = await http.post(Uri.parse(url),body: jsonEncode(<String, dynamic>{
        'qi':_qi
      }),headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);
      print(response.body);
      if(response.statusCode==200)
      {
        var res = jsonDecode(response.body);
        //print(res);
        answerRead();
        return res;


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

  }

}


answerRead() async{
  try{
    SharedPreferences shared = await SharedPreferences.getInstance();
    String _qi = "";
    _qi =  shared.getString('myqi')!;

    var url =Server.con + "/api-mobile/services/answer-has-read";
    var response = await http.post(Uri.parse(url),body: jsonEncode(<String, dynamic>{
      'qi':_qi
    }),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    print(response.body);
    if(response.statusCode==200)
    {
      var res = jsonDecode(response.body);
      //print(res);
      return res;

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

}

