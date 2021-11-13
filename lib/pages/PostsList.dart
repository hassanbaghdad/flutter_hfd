
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hfd_flutter/Server.dart';
import 'package:hfd_flutter/pages/Posts.dart';
import 'package:hfd_flutter/pages/RoutesParameters.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {

  @override

  Widget build(BuildContext context) {

    return Container(
      child:
      FutureBuilder(
          future: Posts().get_posts(),
          builder: (BuildContext context ,AsyncSnapshot snapshot){
            if(snapshot.hasData)
            {
              return Container(
                child: ListView.builder(shrinkWrap: true,itemCount: snapshot.data.length,itemBuilder: (context,i){
                  var splash = snapshot.data[i]["post_splash"];
                  return Container(child:

                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(snapshot.data[i]["post_title"]),
                        subtitle: Text(snapshot.data[i]["post_date"]),
                        leading: Image(image: NetworkImage(Server.con+"/splashs_posts/$splash"),width: 100,),
                        onTap: (){
                          RouteParameters.post["title"] =snapshot.data[i]["post_title"];
                          RouteParameters.post["splash"] =snapshot.data[i]["post_splash"];
                          RouteParameters.post["content"] =snapshot.data[i]["post_content"];
                          Navigator.of(context).pushNamed("view");
                        },

                      ),


                      Divider(color: Colors.grey,thickness: 1,),

                    ],
                  )

                  );
                  // return Text(snapshot.data[0]["post_title"]);
                }),
              )
              ;

            }else{
              return Center(child: Container(child: CircularProgressIndicator(),width: 50,height: 50,),);

            }
          }),
    );
  }
}
