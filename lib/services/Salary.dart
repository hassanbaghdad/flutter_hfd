import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Salary extends StatefulWidget {
  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("استعلام عن راتب"),

      ),
      body: Container(padding:EdgeInsets.all(25),child: Form(child:ListView(children: <Widget>[
        Image(image: AssetImage('assets/qi.png')),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey
              )
            ),
            labelText: "ادخل رقم بطاقة الكي كارد الخاصة بك",
            suffixText: "6330",
            suffixStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
          ),
          maxLength: 12,
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
              Container(margin: EdgeInsets.only(left: 10),child: Icon(Icons.remove_red_eye,color: Colors.white,size: 30,),),


              Text("عرض",style: TextStyle(color: Colors.white,fontSize: 20),),


            ],
          ),
          onPressed: (){},
        ),)

      ],
    ),
      )
    ),
    ));
  }
}
