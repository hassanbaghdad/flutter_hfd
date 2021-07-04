// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hfd_flutter/admin/Dashboard.dart';
import 'package:hfd_flutter/admin/Login.dart';
import 'package:hfd_flutter/admin_pages/Notifications.dart';
import 'package:hfd_flutter/pages/ViewPost.dart';
import 'package:hfd_flutter/services/Salary.dart';
import './pages/Home.dart';
import 'soldiers/Services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "مديرية الشؤون المالية",
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        'home':(context){
          return Home();
        },
        'login':(context){
          return Login();
        },
        'dashboard':(context){
          return Dashboard();
        },
        'services':(context){
          return Services();
        },
        'notifications':(context){
          return Notifications();
        },
        'salary':(context){
          return Salary();
        },
        'view':(context){
          return ViewPost();
        },




      },
    );
  }
}
