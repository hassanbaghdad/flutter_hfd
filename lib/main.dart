// @dart=2.9
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hfd_flutter/admin/Dashboard.dart';
import 'package:hfd_flutter/admin/Login.dart';
import 'package:hfd_flutter/admin_pages/Notifications.dart';
import 'package:hfd_flutter/models/complaintsModel.dart';
import 'package:hfd_flutter/pages/ViewPost.dart';
import 'package:hfd_flutter/services/Complaints.dart';
import 'package:hfd_flutter/services/MartialAndChildren.dart';
import 'package:hfd_flutter/services/Salary.dart';
import 'package:hfd_flutter/services/Store/ComplaintStore.dart';
import 'package:hfd_flutter/services/Store/SendSuccess.dart';
import 'package:hfd_flutter/services/absences.dart';
import 'package:hfd_flutter/services/deductions.dart';
import 'package:hfd_flutter/services/food.dart';
import 'package:hfd_flutter/services/sendComplaints.dart';
import 'package:hfd_flutter/soldiers/StartScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/Home.dart';
import 'soldiers/Services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  Widget build(BuildContext context) {

    myToken();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      getQi(context);

    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('${message.data}');

    });

    return ChangeNotifierProvider(
      create: (context)=> Model(),
      child: MaterialApp(
        title: "مديرية الشؤون المالية",
        home: StartScreen(),
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
          'absences':(context){
            return Absences();
          },
          'deduction':(context){
            return Deductions();
          },
          'food':(context){
            return Food();
          },
          'marital_and_children':(context){
            return MartialAndChildren();
          },
          'start_screen':(context){
            return StartScreen();
          },

          'complaints':(context){
            return Complaints();
          },
          'send_complaint_success':(context){
            return SendComplaintSuccess();
          },

          'view':(context){
            return ViewPost();
          },




        },
      ),
    );
  }
}

getQi(BuildContext context)async{
  SharedPreferences shared =await SharedPreferences.getInstance();
  String qi = shared.getString('myqi');

  if(qi == null)
  {
    Navigator.of(context).pushNamed('start_screen');
  }

  return Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));


}
  myToken()async
  {
   FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
   _firebaseMessaging.subscribeToTopic('hfd-devices');
   var token = await _firebaseMessaging.getToken();
   print("my token is $token");
  }

