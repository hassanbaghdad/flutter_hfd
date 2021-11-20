import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hfd_flutter/Colors/myColors.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:hfd_flutter/pages/RoutesParameters.dart';
import 'package:flutter_html/flutter_html.dart';

class ViewPost extends StatefulWidget {
  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {

    var title = RouteParameters.post["title"];
    var splash = RouteParameters.post["splash"];
    var content = RouteParameters.post["content"];




    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        backgroundColor: MyColors().primary,
      ),
      body:
      Container(child:
      ListView(
        children: <Widget>[
          Container(child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: Server.con+"/splashs_posts/$splash",
                placeholder: (context, url) => Center(child: Container(height:40,width:40,child: new CircularProgressIndicator(),)),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fadeInCurve:Curves.easeIn,
              ),
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
          )
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Card(
                child: Container(child:
                Center(child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                ),
                  padding: EdgeInsets.all(10),
                ),
                color: Colors.green,
                elevation: 10,

              ),
            ),),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Html(data:content ,),
              ),
            ),
          )

        ],)
        ,
      )
          ,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.blue,
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(margin: EdgeInsets.only(left: 10),child: Icon(Icons.home,color: Colors.white,size: 30,),),
                Text("الصفحة الرئيسية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),

              ],
            ),
            onPressed: (){
              Navigator.of(context).pushNamed("home");
            },
          )
        ),

      ),
    )
    );
  }
}
