import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '.././Store.dart';
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
    ListView(children: <Widget>[

      ListTile(
        title: Text("الصفحة الرئيسية",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.home),
        onTap: ()async{
          Navigator.of(context).pushNamed("home");

        },),
      Divider(thickness: 1,color: Colors.grey,),
      ListTile(
        title: Text("خدمات المقاتلين",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.people_alt),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),
      Divider(thickness: 1,color: Colors.grey,),

      hasLogin?Column(children: <Widget>[
          ListTile(
          title: Text("لوحة التحكم",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            leading: Icon(Icons.admin_panel_settings),
            onTap: (){
              Navigator.of(context).pushNamed("dashboard");
            },
          ),
          Divider(thickness: 1,color: Colors.grey,),
          ListTile(
          title: Text("تسجيل الخروج",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          leading: Icon(Icons.logout),
          onTap: ()async{
            await logout();

          },
          )
      ]


      ):ListTile(
        title: Text("تسجيل الدخول",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_forward),
        onTap: (){
          Navigator.of(context).pushNamed("login");
        },
      ),

      Divider(thickness: 1,color: Colors.grey,),
      ListTile(
        title: Text("مشاركة التطبيق",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.share),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),
      Divider(thickness: 1,color: Colors.grey,),
      ListTile(
        title: Text("تابعنا على",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.phonelink_ring),
        onTap: ()async{
          Navigator.of(context).pushNamed("services");

        },),
      Divider(thickness: 1,color: Colors.grey,),

    ],
    )
      ,);
  }
}
