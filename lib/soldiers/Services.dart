import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("خدمات المقاتلين"),
        centerTitle: true,
      ),
      body: Container(

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10,20,5,20),
                      child:Center(
                        child: Card(
                          child: Center(child:
                          Container(
                            height: 150,
                            child: Column(
                            children: <Widget>[
                              Container(
                                height: 102,
                                padding: EdgeInsets.all(10),
                                child: Image(image: AssetImage('assets/qi.png'),fit: BoxFit.contain,),
                              ),
                              Container(
                                color: Colors.green,
                                height: 30,
                                width: double.infinity,
                                child: Text("استعلام عن راتب",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),
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
                Navigator.of(context).pushNamed("salary");
              },
            ),
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10,20,5,20),
                      child:Center(
                        child: Card(
                          child: Center(child:Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(10),
                                  height: 102,
                                  child: Image(image: AssetImage('assets/fam.png'),fit: BoxFit.contain,height: 120,)
                              ),
                              Container(
                                color: Colors.green,
                                height: 30,
                                width: double.infinity,
                                child: Text("الزوجية والاطفال",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),
                              )
                            ],
                          ),
                          ),
                          elevation: 10,
                        ),
                      )
                  )
              ),
              onTap: (){},
            ),
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10,20,5,20),
                      child:Center(
                        child: Card(
                          child: Center(child:Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(10),
                                  height: 102,
                                  child: Image(image: AssetImage('assets/deduction.png'),fit: BoxFit.contain,height: 120,)
                              ),
                              Container(
                                color: Colors.green,
                                height: 30,
                                width: double.infinity,
                                child: Text("الاستقطاعات",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),
                              )
                            ],
                          ),
                          ),
                          elevation: 10,
                        ),
                      )
                  )
              ),
              onTap: (){},
            ),
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10,20,5,20),
                      child:Center(
                        child: Card(
                          child: Center(child:Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(10),
                                  height: 102,
                                  child: Image(image: AssetImage('assets/absence.png'),fit: BoxFit.contain,height: 120,)
                              ),
                              Container(
                                color: Colors.green,
                                height: 30,
                                width: double.infinity,
                                child: Text("الغيابات",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),
                              )
                            ],
                          ),
                          ),
                          elevation: 10,
                        ),
                      )
                  )
              ),
              onTap: (){},
            ),
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10,20,5,20),
                      child:Center(
                        child: Card(
                          child: Center(child:Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(10),
                                  height: 102,
                                  child:  Image(image: AssetImage('assets/complaint.png'),fit: BoxFit.contain,height: 120,)
                              ),
                              Container(
                                color: Colors.green,
                                height: 30,
                                width: double.infinity,
                                child: Text("تقديم شكوى",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),
                              )
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

          ],
        ),
      ),
    ));
  }
}
