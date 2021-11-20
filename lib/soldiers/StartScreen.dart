import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hfd_flutter/Colors/myColors.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:hfd_flutter/Store.dart';
import 'package:hfd_flutter/pages/Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatelessWidget {
  TextEditingController qi = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    getQi(context);
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("تطبيق مديرية الشؤون المالية"),
        backgroundColor: MyColors().primary,

      ),
      body: Container(padding:EdgeInsets.all(25),child: Form(child:ListView(children: <Widget>[
        Image(image: AssetImage('assets/qi.png')),
        TextFormField(
          controller: qi,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey
                  )
              ),
              labelText: "ادخل رقم بطاقة الكي كارد الخاصة بك",
              suffixStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
          ),
          maxLength: 16,
          keyboardType: TextInputType.number,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        ),
        Container(child: RaisedButton(
          padding: EdgeInsets.all(10),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(left: 10),child: Icon(Icons.check,color: Colors.white,size: 30,),),


              Text("تفعيل التطبيق",style: TextStyle(color: Colors.white,fontSize: 20),),


            ],
          ),
          onPressed: (){
            confirmQi(context, qi.text);
          },
        ),)

      ],
      ),
      )
      ),
    ));
  }
}

  confirmQi(BuildContext context ,String qi) async{

    if(qi.length ==16)
      {
        var url =Server.con + "/api-mobile/services/confirm-qi";
        var token = Store().getToken();
        var response = await http.post(Uri.parse(url),body: jsonEncode(<String, String>{

          'qi':qi,

        }),headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },);

        var res = jsonDecode(response.body);
        if(res["msg"]=='تم تفعيل التطبيق بنجاح')
          {
            SharedPreferences shared =await SharedPreferences.getInstance();
            shared.setString('myqi', qi);

            print(shared.getString('myqi'));

            Fluttertoast.showToast(
              msg: res["msg"],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 18,
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
          }

      }

  }
Future getQi(BuildContext context) async{
  SharedPreferences shared =await SharedPreferences.getInstance();
  String? qi = shared.getString('myqi');

  if(qi == null)
    {
      return false;
    }

  return Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));


}
