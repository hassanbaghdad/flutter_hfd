import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hfd_flutter/Colors/myColors.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("خدمات المقاتلين"),
        centerTitle: true,
        backgroundColor: MyColors().primary,
      ),
      body: Container(

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            aInkWell(context,"assets/qi.png","استعلام عن راتب","salary"),
            aInkWell(context,"assets/fam.png","الزوجية والاطفال","marital_and_children"),
            aInkWell(context,"assets/deduction.png","نفقة وديون","deduction"),
            aInkWell(context,"assets/absence.png","الغيابات","absences"),
            aInkWell(context,"assets/food.png","مخصصات طعام","food"),
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child:Center(
                        child: Card(
                          child: Center(child:Column(
                            children: <Widget>[
                              Expanded(child: Container(
                                  child:  Icon(Icons.mail_outline,size: 100,color: Colors.blue,)
                              ),
                              flex: 8,),
                              Expanded(child: Container(
                                color: MyColors().secondary,
                                height: 30,
                                width: double.infinity,
                                child: Text("صندوق الوارد",style: TextStyle(fontSize: 18,color: MyColors().font),textAlign: TextAlign.center,),
                              )
                              ,
                              flex: 3,)
                            ],
                          ),
                          ),
                          elevation: 10,
                        ),
                      )
                  )
              ),
              onTap: (){
                Navigator.of(context).pushNamed("complaints");
              },
            ),
            aInkWell(context,"assets/complaint.png","تفقديم شكوى","complaints"),
            aInkWell(context,"assets/history.png","سجل رواتبي","complaints"),





          ],
        ),
      ),
    ));
  }

  InkWell aInkWell(BuildContext context,String _imgUrl,String _label,String _to) {
    return InkWell(
            child: Container(

                padding: EdgeInsets.all(0),
                child: Container(

                    padding: EdgeInsets.all(15),
                    child:Center(
                      child: Card(
                        child: Center(child:
                        Container(
                          child: Column(
                            children: <Widget>[
                              Expanded(child: Container(
                                padding: EdgeInsets.all(20),
                                child: Image(image: AssetImage(_imgUrl),fit: BoxFit.contain,),
                              ),
                                flex: 8,
                              )
                              ,
                              Expanded(child: Container(
                                //padding: EdgeInsets.all(5),
                                color: MyColors().secondary,
                                width: double.infinity,
                                child: Text(_label,style: TextStyle(fontSize: 18,color: MyColors().font),textAlign: TextAlign.center,),
                              ),
                                flex: 3,
                              )
                            ],
                          ),)
                        ),
                        elevation: 10,
                      ),
                    )
                )
            ),
            onTap: (){
              Navigator.of(context).pushNamed(_to);
            },
          );
  }
}
