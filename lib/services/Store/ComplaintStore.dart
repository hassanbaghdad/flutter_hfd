import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:smart_select/smart_select.dart';

class Model extends ChangeNotifier
{
  String complaint_type ="موضوع الشكوى" ;
  String complaint_text ="" ;
  String complaint_soldier_name ="" ;
  String mother_name ="" ;
  String complaint_soldier_qi ="" ;
  String complaint_soldier_phone ="" ;
  String formation ="" ;
  String place_birthday ="بغداد" ;
  String birthday_date ="" ;
  String marital_state ="اعزب/باكر" ;
  String husband_name ="" ;
  String job_state ="" ;
  String wifes_count ="1" ;
  String children_count ="0" ;
  String academic ="أمي" ;
  String purview ="" ;
  String university ="" ;
  String college ="" ;
  String section ="" ;
  String city ="بغداد" ;
  String area ="" ;
  String nearest_point ="" ;
  String last_job ="" ;
  String religion ="مسلم" ;
  String id_type ="هوية الاحوال المدنية" ;
  String nat_id_no ="" ;
  String nat_id_date ="" ;
  String nat_id_issuer ="" ;
  String civil_id_no ="" ;
  String civil_id_newspaper_no ="" ;
  String civil_record_no ="" ;
  String civil_issuer_date ="" ;
  String residence_card_no ="" ;
  String residence_card_date ="" ;

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

  changePlaceBirthday(str)
  {
    place_birthday = str;
    notifyListeners();
  }
  changeWifesCount(str)
  {
    wifes_count = str;
    notifyListeners();
  }
  changeChildrenCount(str)
  {
    children_count = str;
    notifyListeners();
  }

  changeCity(str)
  {
    city = str;
    notifyListeners();
  }

  changeMaritalState(str)
  {
    marital_state = str;
    notifyListeners();
  }
   changeLearn(str)
  {
    academic = str;
    notifyListeners();
  }
  changeReligion(str)
  {
    religion = str;
    notifyListeners();
  }
  changeIdType(str)
  {
    id_type = str;
    notifyListeners();
  }


}