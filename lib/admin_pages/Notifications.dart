import 'package:flutter/material.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '.././Store.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  TextEditingController title = new TextEditingController();
  TextEditingController msg = new TextEditingController();
  var sending = false;
  var token = "";

  get_token() async{
     token = await Store().getToken();
     if(token == "" && token ==null)
       {
         Navigator.of(context).pushNamed("login");
       }
  }
  Widget build(BuildContext context) {
    get_token();
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("ارسال رسالة للمجاهدين"),
        actions: [
          Container(padding: EdgeInsets.all(10),child:  Icon(Icons.email),)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: ListView(children:<Widget>[
            Container(margin: EdgeInsets.only(top: 30),child: TextFormField(
              controller: title,
              decoration: InputDecoration(
                  labelText: "عنوان الرسالة",
                  prefixIcon: Icon(Icons.subject),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  )
              ),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),),
            Container(margin: EdgeInsets.only(top: 30),child: TextFormField(
              controller: msg,
              decoration: InputDecoration(
                  labelText: "الرسالة",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  )
              ),
              style: TextStyle(fontSize: 20),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              minLines: 4,
              maxLines: 6,
            ),),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: RaisedButton(
                color: Colors.green,
                padding: EdgeInsets.all(10),
                child:  Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                  sending?Text(""):Icon(Icons.send,size: 30,color: Colors.white,),
                  sending?CircularProgressIndicator(color: Colors.white,):Text("ارسال",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
                ),
                onPressed: (){
                  if(title.text != "" && msg.text !="")
                    {
                      sendNotification();
                    }else{
                    myAlert("عفوا لايمكن ارسال رسالة فارغة", Colors.red);
                  }

                },
              ),
            )

          ]),
        ),
      ),
    ));
  }
  sendNotification() async{
    setState(() {
      sending = true;
    });

    var url =Server.con+"/api/0x07/notifications/send";

    var response = await http.post(Uri.parse(url),body: jsonEncode(<String, String>{
      'title': title.text,
      'body': msg.text,


    }),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },);


    if (response.statusCode == 200) {
      //var body = jsonDecode(response.body);
      myAlert("تم ارسال الرسالة بنجاح", Colors.blue);

    }else{
      Navigator.of(context).pushNamed("login");
    }
    setState(() {
      sending = false;
    });

  }

  myAlert(String text, Color color)
  {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 18,
    );
  }
}





