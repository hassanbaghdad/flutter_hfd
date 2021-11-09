import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class Model extends ChangeNotifier
{
  String complaint_type = "";
  String place_birthday = "";
  String marital_state = "";
  String learn = "";
  String city = "";
  String area = "";
  String nearest_point = "";
  String religion = "";
  String id_type = "";

  late File soldier_id_front;
  late File soldier_id_back;
  late File husband_id_front;
  late File husband_id_back;
  late File child_id_front;
  late File child_id_back;
  late File contract;
  late File long_card;
  late File resident_card_front;
  late File resident_card_back;


  String text = "kkk";
  bool marital_and_children = false;

  changeComplaintType(value)
  {
    complaint_type = value;
    notifyListeners();
  }

  changeComplaint(str)
  {
    print(str);
    complaint_type = str;
    notifyListeners();
  }
  changeText(str)
  {
    text = str;
    notifyListeners();
  }


}