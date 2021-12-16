
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hfd_flutter/Colors/myColors.dart';
import 'package:hfd_flutter/Store.dart';
import 'package:hfd_flutter/components/localStore.dart';
import 'package:hfd_flutter/pages/Posts.dart';
import 'package:hfd_flutter/pages/PostsList.dart';
import '../components/Drawer.dart';
import '../pages/Carousel.dart';
import 'package:badges/badges.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalStore().getAnswersCount();
    return Directionality(textDirection: TextDirection.rtl, child:
    Scaffold(
      appBar: AppBar(
        title: Text("الصفحة الرئيسية"),
        backgroundColor: MyColors().primary,
        centerTitle: true,
        actions: <Widget>[
          Container(
              child: IconButton(icon:Icon(Icons.mail),onPressed: (){Navigator.of(context).pushNamed("answers");},),
          )
        ],
        leading:Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),


      ),
      //body: PostsList(),


      body: Column(
        children: <Widget>[

          MyCarousel(),
          Container(

            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
            padding: EdgeInsets.all(10),
            child: Text("اخر الاخبار",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
            ,color: MyColors().primary,
            width: double.infinity,),
          Expanded(child: PostsList(),)


          ,





        ],
      ),

      drawer: MyDrawer(),
    )
    );
  }
}

