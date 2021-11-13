import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '.././Store.dart';
import 'package:badges/badges.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override

  var hasLogin = false;
  get_login_state() async{

    bool is_log = false;
    is_log = await Store().get_login_state();

    if(is_log)
      {
        setState(() {
          hasLogin = true;
        });
      }else{
      setState(() {
        hasLogin=false;
      });
    }

  }
  logout() async{
    bool is_log = false ;
    is_log = await Store().logout();

    if(is_log)
      {
        setState(() {
          hasLogin =true;
        });
      }else{
      setState(() {
        hasLogin=false;
        //Navigator.of(context).pop();
        Navigator.of(context).pushNamed("home");
      });
    }
  }


  Widget build(BuildContext context) {
    get_login_state();
    return Drawer(child:
    Container(child: ListView(children: <Widget>[

      ListTile(
        title: Text("الصفحة الرئيسية",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: Icon(Icons.home,color: Colors.white,),
        onTap: ()async{
          Navigator.of(context).pushNamed("home");

        },),

      ListTile(
        title: Text("خدمات المقاتلين",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: Icon(Icons.people_alt,color: Colors.white),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),
      ListTile(
        title: Text("صندوق الوارد",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: Badge(
          badgeContent: Text('1',style: TextStyle(color: Colors.white),),
          child: Icon(Icons.mail,color: Colors.white,),

        ),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),


      hasLogin?Column(children: <Widget>[
        ListTile(
          title: Text("لوحة التحكم",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
          leading: Icon(Icons.admin_panel_settings,color: Colors.white),
          onTap: (){
            Navigator.of(context).pushNamed("dashboard");
          },
        ),

        ListTile(
          title: Text("تسجيل الخروج",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
          leading: Icon(Icons.logout,color: Colors.white),
          onTap: ()async{
            await logout();

          },
        )
      ]


      ):ListTile(
        title: Text("تسجيل الدخول",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: Icon(Icons.arrow_forward,color: Colors.white),
        onTap: (){
          Navigator.of(context).pushNamed("login");
        },
      ),


      ListTile(
        title: Text("مشاركة التطبيق",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: Icon(Icons.share,color: Colors.white),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),

      ListTile(
        title: Text("تابعنا على",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        leading: Icon(Icons.phonelink_ring,color: Colors.white),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),


    ],
    ),color: Colors.green,)
      ,);
  }
}
