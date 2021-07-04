
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hfd_flutter/pages/Posts.dart';
import 'package:hfd_flutter/pages/PostsList.dart';
import '../components/Drawer.dart';
import '../pages/Carousel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return Directionality(textDirection: TextDirection.rtl, child:
    Scaffold(
      appBar: AppBar(
        title: Text("الصفحة الرئيسية"),
        centerTitle: true,
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
            child: Text("اخر الاخبار",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),color: Colors.blue,
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
