import 'dart:developer';
import 'dart:io';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hfd_flutter/Colors/myColors.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:hfd_flutter/Store.dart';
import 'package:hfd_flutter/soldiers/storeSoldier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;


class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  Container aDatePiker(BuildContext context, String _label , TextEditingController _controller) {
    return Container(
        child:TextButton(
            onPressed: () {
              DatePicker.showDatePicker(context,

                  showTitleActions: true,
                  minTime: DateTime(2021, 10, 1),
                  maxTime: DateTime(2022, 12, 31), onChanged: (date) {

                    print(date.month.toString());
                  }, onConfirm: (date) {
                    setState(() {
                      _year = date.year;
                      _month = date.month;
                      _controller.text = date.toString().substring(0,10);
                    });
                    _controller.text = date.toString().substring(0,10);
                  }, currentTime: DateTime.now(), locale: LocaleType.ar );
            },
            child: Container(

              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextFormField(
                enabled: false,
                controller: _controller,
                decoration: InputDecoration(

                  label: Text(_label),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.black54)
                  ),

                ),
              ),)
        )
    );
  }
  TextEditingController date = new TextEditingController();

  TextEditingController qi = new TextEditingController();
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  final formatCurrency = intl.NumberFormat.simpleCurrency(name: '',locale: 'ar_IQ',decimalDigits: 0);
  String _food = "" ;
  bool loading = false;
  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    getQi();

    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("استعلام عن استقطاع طعام"),
        backgroundColor: MyColors().primary,
      ),
      body: Container(padding:EdgeInsets.all(10),child: Form(child:ListView(children: <Widget>[

        Image(image: AssetImage('assets/qi.png')),
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
          controller: qi,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey
                  )
              ),
              labelText: "ادخل رقم بطاقة الكي كارد الخاصة بك",
              suffixStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              counter: Text('16')
          ),
          maxLength: 16,
          keyboardType: TextInputType.number,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        ),),
        Container(
            child: aDatePiker(context, "انقر لتحديد الشهر", date)
        ),
        Container(child: RaisedButton(
          padding: EdgeInsets.all(10),
          color: Colors.green,
          child: !loading?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(left: 10),child: Icon(Icons.remove_red_eye,color: Colors.white,size: 30,),),
              Text("عرض الاستقطاع",style: TextStyle(color: MyColors().font,fontSize: 20),),
            ],
          ):CircularProgressIndicator(color: Colors.white,),
          onPressed: (){
            get_food(qi.text);
          },
        ),),


              loaded?Center(child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1),borderRadius: BorderRadius.circular(10)),
                child: Text("$_food",style: TextStyle(fontSize: 20)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(40),
              ),):SizedBox()


      ],
      ),
      )
      ),
    ));
  }
  get_food(String _qi) async{
    // var qi ="6330134305825080";

    try{
      setState(() {
        _food = "";
      });
      loading = true;
      var url =Server.con + "/api-mobile/services/get-food";
      var token = Store().getToken();
      var response = await http.post(Uri.parse(url),body: jsonEncode(<String, dynamic>{
        'qi':_qi,
        'month':_month,
        'year':_year

      }),headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);
      print(response.body);
      if(response.statusCode==200)
      {
        var res = jsonDecode(response.body);
        setState(() {
          _food = res["food_money"].toString();
          loaded = true;
        });

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
      setState(() {
        loading = false;
      });
    }




  }

  getQi() async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    String _qi = "";
    _qi =  shared.getString('myqi')!;
    setState(() {
      qi.text = _qi;
    });
  }
}




