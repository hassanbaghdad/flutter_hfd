
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:smart_select/smart_select.dart';

class ComplaintsModel extends ChangeNotifier{
  String complaint_type ="" ;
  String complaint_text ="" ;
  TextEditingController complaint_soldier_name = new TextEditingController() ;
  TextEditingController mother_name =new TextEditingController();
  TextEditingController complaint_soldier_qi = new TextEditingController() ;
  TextEditingController complaint_soldier_phone = new TextEditingController() ;
  TextEditingController formation = new TextEditingController() ;
  String place_birthday ="" ;
  TextEditingController birthday_date = new TextEditingController() ;
  String marital_state ="" ;
  TextEditingController husband_name =new TextEditingController() ;
  TextEditingController job_state =new TextEditingController() ;
  TextEditingController wifes_count =new TextEditingController() ;
  TextEditingController children_count =new TextEditingController() ;
  String academic ="" ;
  TextEditingController purview =new TextEditingController() ;
  TextEditingController university =new TextEditingController() ;
  TextEditingController college =new TextEditingController() ;
  TextEditingController section =new TextEditingController() ;
  String city ="" ;
  TextEditingController area =new TextEditingController() ;
  TextEditingController nearest_point =new TextEditingController() ;
  TextEditingController last_job =new TextEditingController() ;
  String religion ="" ;
  String id_type ="هوية الاحوال المدنية" ;
  TextEditingController nat_id_no =new TextEditingController() ;
  TextEditingController nat_id_date =new TextEditingController() ;
  TextEditingController nat_id_issuer =new TextEditingController() ;
  TextEditingController civil_id_no =new TextEditingController() ;
  TextEditingController civil_id_newspaper_no =new TextEditingController() ;
  TextEditingController civil_record_no =new TextEditingController() ;
  TextEditingController civil_issuer_date =new TextEditingController() ;
  TextEditingController residence_card_no =new TextEditingController() ;
  TextEditingController residence_card_date =new TextEditingController() ;

  File  soldierIdFront =new File("");

  List<S2Choice<String>> complaintTypes = [
    S2Choice<String>(value: 'شهيد', title: 'شهيد'),
    S2Choice<String>(value: 'ايقاف راتب', title: 'ايقاف راتب'),
    S2Choice<String>(value: 'مخصصات', title: 'مخصصات'),
    S2Choice<String>(value: 'نفقة', title: 'نفقة'),
    S2Choice<String>(value: 'بطاقة كي كارد', title: 'بطاقة كي كارد'),
    S2Choice<String>(value: 'اخرى', title: 'اخرى'),
  ];
  List<S2Choice<String>> maritalState = [

    S2Choice<String>(value: 'اعزب/باكر', title: 'اعزب/باكر'),
    S2Choice<String>(value: 'متزوج/ة', title: 'متزوج/ة'),
    S2Choice<String>(value: 'مطلق/ة', title: 'مطلق/ة'),
    S2Choice<String>(value: 'ارمل/ة', title: 'ارمل/ة'),
  ];
  List<S2Choice<String>> learns = [



    S2Choice<String>(value: 'يقرأ ويكتب', title: 'أمي'),
    S2Choice<String>(value: 'ابتدائية', title: 'ابتدائية'),
    S2Choice<String>(value: 'متوسطة', title: 'متوسطة'),
    S2Choice<String>(value: 'اعدادية', title: 'اعدادية'),
    S2Choice<String>(value: 'حوزوي', title: 'حوزوي'),
    S2Choice<String>(value: 'دبلوم', title: 'دبلوم'),
    S2Choice<String>(value: 'بكالوريوس', title: 'بكالوريوس'),
    S2Choice<String>(value: 'ماجستير', title: 'ماجستير'),
    S2Choice<String>(value: 'دكنزوراه', title: 'دكنزوراه'),
  ];

  List<S2Choice<String>> cities = [

    S2Choice<String>(value: 'بغداد', title: 'بغداد'),
    S2Choice<String>(value: 'بابل', title: 'بابل'),
    S2Choice<String>(value: 'كربلاء', title: 'كربلاء'),
    S2Choice<String>(value: 'الأنبار', title: 'الأنبار'),
    S2Choice<String>(value: 'البصرة', title: 'البصرة'),
    S2Choice<String>(value: 'دهوك', title: 'دهوك'),
    S2Choice<String>(value: 'القادسية', title: 'القادسية'),
    S2Choice<String>(value: 'ديالى', title: 'ديالى'),
    S2Choice<String>(value: 'أربيل', title: 'أربيل'),
    S2Choice<String>(value: 'ذي قار', title: 'ذي قار'),
    S2Choice<String>(value: 'السليمانية', title: 'السليمانية'),
    S2Choice<String>(value: 'صلاح الدين', title: 'صلاح الدين'),
    S2Choice<String>(value: 'كركوك', title: 'كركوك'),
    S2Choice<String>(value: 'المثنى', title: 'المثنى'),
    S2Choice<String>(value: 'ميسان', title: 'ميسان'),
    S2Choice<String>(value: 'النجف', title: 'النجف'),
    S2Choice<String>(value: 'نينوى', title: 'نينوى'),
    S2Choice<String>(value: 'واسط', title: 'واسط'),
  ];
  List<S2Choice<String>> religions = [


    S2Choice<String>(value: 'مسلم', title: 'مسلم'),
    S2Choice<String>(value: 'مسيحي', title: 'مسيحي'),
    S2Choice<String>(value: 'صابئي', title: 'صابئي'),
    S2Choice<String>(value: 'ايزيدي', title: 'ايزيدي'),
    S2Choice<String>(value: 'شبكي', title: 'شبكي'),
    S2Choice<String>(value: 'اخرى', title: 'اخرى'),
  ];
  List<S2Choice<String>> idtypes = [


    S2Choice<String>(value: 'البطاقة الوطنية الموحدة', title: 'البطاقة الوطنية الموحدة'),
    S2Choice<String>(value: 'هوية الاحوال المدنية', title: 'هوية الاحوال المدنية'),
  ];

  List <String> listComplaintsType = [
    'موضوع الشكوى',
    'شهيد',
    'جريح',
    'ايقاف راتب',
    'مخصصات',
    'نفقة',
    'بطاقة كي كارد',
    'اخرى',
  ];
  List <String> listCites = [
    'بغداد',
    'بابل',
    'كربلاء',
    'الأنبار',
    'البصرة',
    'دهوك',
    'القادسية',
    'ديالى',
    'أربيل',
    'ذي قار',
    'السليمانية',
    'صلاح الدين',
    'كركوك',
    'المثنى',
    'ميسان',
    'النجف',
    'نينوى',
    'واسط',
  ];

  changeCompaintType(String str)
  {
    complaint_type = str;
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
  changeSoldierIdFront(file)
  {
    soldierIdFront = file;
    notifyListeners();
    print(soldierIdFront.path);
  }


}