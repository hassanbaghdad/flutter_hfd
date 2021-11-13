import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:hfd_flutter/pages/RoutesParameters.dart';
import '../pages/Posts.dart';
import '../pages/ViewPost.dart';
class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {

  @override
  Widget build(BuildContext context) {

    return
      Container(
        child: Container(
          height: 230,
            child: FutureBuilder(
                future: Posts().get_posts(),
                builder: (BuildContext context ,AsyncSnapshot snapshot)
                {
                  var list =  [];

                  if(snapshot.hasData)
                  {
                    for(int x=0; x<snapshot.data.length ;x++)
                      {
                        print(snapshot.data[x]['post_splash']);
                        var image_name = snapshot.data[x]['post_splash'];
                        list.add(
                          InkWell(child:Column(
                            children: <Widget>[
                              Expanded(child: Stack(
                                children: [ Container(child:  CachedNetworkImage(
                                  imageUrl: Server.con+"/splashs_posts/$image_name",
                                  placeholder: (context, url) => Center(child: Container(height:40,width:40,child: new CircularProgressIndicator(),)),
                                  errorWidget: (context, url, error) => new Icon(Icons.error),
                                  fadeInCurve:Curves.easeIn,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                                )

                                  ,
                                  Positioned(child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(10),
                                    //color: Colors.red.withOpacity(0.8),
                                    margin: EdgeInsets.fromLTRB(20,140,0,0),
                                    child: Row(children: <Widget>[
                                      Icon(Icons.arrow_left_rounded,textDirection: TextDirection.ltr,size: 25,color: Colors.white,),
                                      Expanded(child: Text(snapshot.data[x]["post_title"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.right,))
                                    ],),
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.8),
                                    ),
                                  )
                                  ),


                                ],
                              ),)


                            ],) ,onTap: (){
                            RouteParameters.post["title"] =snapshot.data[x]["post_title"];
                            RouteParameters.post["splash"] =snapshot.data[x]["post_splash"];
                            RouteParameters.post["content"] =snapshot.data[x]["post_content"];
                            Navigator.of(context).pushNamed("view");
                          }
                          ,)


                        );

                      }


                        return Container(

                          child: Card(
                            child: Container(
                              child: SizedBox(
                                height: 200.0,
                                width: double.infinity,
                                child: Carousel(
                                  boxFit: BoxFit.cover,
                                  autoplay: false,
                                  animationCurve: Curves.fastOutSlowIn,
                                  animationDuration: Duration(milliseconds: 1000),
                                  dotSize: 6.0,
                                  dotIncreasedColor: Color(0xFFFF335C),
                                  dotBgColor: Colors.transparent,
                                  dotPosition: DotPosition.topRight,
                                  dotVerticalPadding: 10.0,
                                  showIndicator: false,
                                  indicatorBgPadding: 7.0,
                                  images: list,

                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            elevation: 10,
                          ),
                        );


                  }else{
                    return Center(child: Container(child: CircularProgressIndicator(),height: 50,width: 50,),);
                  }

                }

            )
        ),
      );
  }
}
