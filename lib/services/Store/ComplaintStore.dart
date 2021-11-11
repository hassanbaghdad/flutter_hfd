import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:smart_select/smart_select.dart';

class Model extends ChangeNotifier
{
  String complaint_type ="مخصصات" ;
  String complaint_text ="" ;
  String complaint_soldier_name ="" ;
  String mother_name ="" ;
  String complaint_soldier_qi ="" ;
  String complaint_soldier_phone ="" ;
  String formation ="" ;
  String place_birthday ="" ;
  String birthday_date ="" ;
  String marital_state ="" ;
  String husband_name ="" ;
  String job_state ="" ;
  String wifes_count ="" ;
  String children_count ="" ;
  String academic ="" ;
  String purview ="" ;
  String university ="" ;
  String college ="" ;
  String section ="" ;
  String city ="" ;
  String area ="" ;
  String nearest_point ="" ;
  String last_job ="" ;
  String religion ="" ;
  String id_type ="" ;
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

  List<S2Choice<String>> complaint_types = [
    S2Choice<String>(value: 'شهيد', title: 'شهيد'),
    S2Choice<String>(value: 'جريح', title: 'جريح'),
    S2Choice<String>(value: 'ايقاف راتب', title: 'ايقاف راتب'),
    S2Choice<String>(value: 'مخصصات', title: 'مخصصات'),
    S2Choice<String>(value: 'نفقة', title: 'نفقة'),
    S2Choice<String>(value: 'بطاقة كي كارد', title: 'بطاقة كي كارد'),
    S2Choice<String>(value: 'اخرى', title: 'اخرى'),
  ];

  List<S2Choice<String>>cities = [
    S2Choice<String>(value: 'بغداد', title: 'بغداد'),
    S2Choice<String>(value: 'بابل', title: 'بابل'),
    S2Choice<String>(value: 'كربلاء', title: 'كربلاء'),
    S2Choice<String>(value: 'البصرة', title: 'البصرة'),
    S2Choice<String>(value: 'النجف', title: 'النجف'),
    S2Choice<String>(value: 'القادسية', title: 'القادسية'),
    S2Choice<String>(value: 'ذي قار', title: 'ذي قار'),
    S2Choice<String>(value: 'نينوى', title: 'نينوى'),
    S2Choice<String>(value: 'صلاح الدين', title: 'صلاح الدين'),
    S2Choice<String>(value: 'كركوك', title: 'كركوك'),
    S2Choice<String>(value: 'ديالى', title: 'ديالى'),
    S2Choice<String>(value: 'الانبار', title: 'الانبار'),
    S2Choice<String>(value: 'ميسان', title: 'ميسان'),
    S2Choice<String>(value: 'واسط', title: 'واسط'),
    S2Choice<String>(value: 'المثنى', title: 'المثنى'),
    S2Choice<String>(value: 'ابربيل', title: 'اربيل'),
    S2Choice<String>(value: 'دهوك', title: 'دهوك'),
    S2Choice<String>(value: 'سليمانية', title: 'سليمانية'),
  ];

  List<S2Choice<String>> marital_states = [
    S2Choice<String>(value: '1', title: 'اعزب / باكر'),
    S2Choice<String>(value: '2', title: 'متزوج / ة'),
    S2Choice<String>(value: '3', title: 'مطلق / ة'),
    S2Choice<String>(value: '4', title: 'ارمل / ة'),
  ];

  List<S2Choice<String>> learns = [
    S2Choice<String>(value: 'أمي', title: 'أمي'),
    S2Choice<String>(value: 'يقرأ ويكتب', title: 'يقرأ ويكتب'),
    S2Choice<String>(value: 'ابتدائية', title: 'ابتدائية'),
    S2Choice<String>(value: 'متوسطة', title: 'متوسطة'),
    S2Choice<String>(value: 'اعدادية', title: 'اعدادية'),
    S2Choice<String>(value: 'دبلوم', title: 'دبلوم'),
    S2Choice<String>(value: 'حوزوي', title: 'حوزوي'),
    S2Choice<String>(value: 'بكالوريوس', title: 'بكالوريوس'),
    S2Choice<String>(value: 'ماجستير', title: 'ماجستير'),
    S2Choice<String>(value: 'دكتوراه', title: 'دكتوراه'),
  ];
   changeLearn(str)
  {
    academic = str;
    notifyListeners();
  }
  List<S2Choice<String>> religions = [
    S2Choice<String>(value: '1', title: 'مسلم'),
    S2Choice<String>(value: '2', title: 'مسيحي'),
    S2Choice<String>(value: '3', title: 'صابئي'),
    S2Choice<String>(value: '4', title: 'ايزيدي'),
    S2Choice<String>(value: '4', title: 'اخرى'),
  ];
  List<S2Choice<String>> id_types = [
    S2Choice<String>(value: '1', title: 'هوية الاحوال المدنية'),
    S2Choice<String>(value: '2', title: 'البطاقة الوطنية الموحدة'),
  ];

}