import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '.././Store.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  var isLodaing = false;
  var error = false;
  var username = new TextEditingController();
  var password = new TextEditingController();

  var hasLogin = false;

  // get_login_state() async{
  //   hasLogin = await Store().get_login_state();
  //
  //   if(hasLogin)
  //     {
  //       Navigator.of(context).pop();
  //     }
  // }
  @override

  Widget build(BuildContext context) {
  //get_login_state();
  username.text ="hassan";
  password.text="123456";
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("تسجيل الدخول"),
            centerTitle: true,
          ),
          body: Center(child:
          Form(
              child: Container(padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                margin: EdgeInsets.only(top: 20),
                child:TextFormField(
                  controller: username,
                      decoration: InputDecoration(
                        labelText: "اسم المستخدم",
                        border :OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2
                            )
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      autofocus: true,
                    ),
                ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          labelText: "كلمة المرور",
                          border :OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2
                              )
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        autofocus: true,
                        obscureText: true,
                      ),
                    ),
                    Container(
                    margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[

                            isLodaing?Center(child: CircularProgressIndicator(color: Colors.white,),):Text("دخول",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                            isLodaing?Text(""):Icon(Icons.arrow_forward,color: Colors.white,)

                          ] ,
                        ),
                        onPressed: (){
                          login();
                        },
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Text(""
                        )

                      )
                    )
                  ],
                ),
              )
          ),
          )
        ));
  }

  login() async {
    setState(() {
      isLodaing = true;
    });


    var url =Server.con+"/api-auth/login";
    
    var response = await http.post(Uri.parse(url),body: jsonEncode(<String, String>{
      'username': username.text,
      'password': password.text,

    }),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    setState(() {
      isLodaing = false;
    });
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print("success");
      Store().saveToken(body["access_token"]);
      Navigator.of(context).pushNamed("dashboard");
      // Navigator.of(context).pushNamed("dashboard");
    }else{
      setState(() {
        error = true;

      });
      print(response.statusCode);

      Fluttertoast.showToast(
          msg: "اسم المستخدم او كلمة المرور غير صحيحة",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18,
      );
    }

  }

}
