// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hfd_flutter/admin/Dashboard.dart';
import 'package:hfd_flutter/admin/Login.dart';
import 'package:hfd_flutter/admin_pages/Notifications.dart';
import 'package:hfd_flutter/pages/ViewPost.dart';
import 'package:hfd_flutter/services/Complaints.dart';
import 'package:hfd_flutter/services/Salary.dart';
import 'package:hfd_flutter/services/Store/ComplaintStore.dart';
import './pages/Home.dart';
import 'soldiers/Services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> Model(),
      child: MaterialApp(
        title: "مديرية الشؤون المالية",
        home: Home(),
        debugShowCheckedModeBanner: true,
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
          'complaints':(context){
            return Complaints();
          },

          'view':(context){
            return ViewPost();
          },




        },
      ),
    );

  }
}
