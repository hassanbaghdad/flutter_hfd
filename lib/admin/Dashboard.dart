import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hfd_flutter/components/Drawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:
    Scaffold(
      appBar: AppBar(
        title: Text("لوحة التحكم"),
        centerTitle: true,
        leading:Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            InkWell(child:  Container(color: Colors.lightGreen,margin: EdgeInsets.all(20),child:
            GridTile(
              child:Container(child:Icon(Icons.notifications,size: 60,color: Colors.white,),margin: EdgeInsets.all(20),),
              footer: Container(
                height: 40,
                color: Colors.black54,
                child: Center(child: Text("رسالة للمجاهدين",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),),
              ),
            )
              ,),onTap: (){
              Navigator.of(context).pushNamed("notifications");
            },),



          ],
        ),
      ),
      drawer: MyDrawer(),
    )
    );
  }
}
