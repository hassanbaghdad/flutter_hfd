import 'package:flutter/material.dart';

class SendComplaintSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("نجح"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.check_circle,color: Colors.green,size: 80,),
              Container(child: Text("تم ارسال الشكوى بنجاح",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),margin: EdgeInsets.only(top: 20),),
              Text("سوف يتم الرد عليك من خلال هذا التطبيق",style: TextStyle(fontSize: 18),),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.home,color: Colors.white,),
                      Text("الصفحة الرئيسية",style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed("home");
                  },
                ),
              )
            ],
          )
        ),
      ),
    ));
  }
}
