import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class Lists {
  List<S2Choice<String>> complaint_types = [
    S2Choice<String>(value: '1', title: 'شهيد'),
    S2Choice<String>(value: '2', title: 'جريح'),
    S2Choice<String>(value: '3', title: 'ايقاف راتب'),
    S2Choice<String>(value: '4', title: 'مخصصات'),
    S2Choice<String>(value: '5', title: 'نفقة'),
    S2Choice<String>(value: '6', title: 'بطاقة كي كارد'),
    S2Choice<String>(value: '7', title: 'اخرى'),
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
    S2Choice<String>(value: '1', title: 'أمي'),
    S2Choice<String>(value: '2', title: 'يقرأ ويكتب'),
    S2Choice<String>(value: '3', title: 'ابتدائية'),
    S2Choice<String>(value: '4', title: 'متوسطة'),
    S2Choice<String>(value: '5', title: 'اعدادية'),
    S2Choice<String>(value: '6', title: 'دبلوم'),
    S2Choice<String>(value: '7', title: 'حوزوي'),
    S2Choice<String>(value: '8', title: 'بكالوريوس'),
    S2Choice<String>(value: '9', title: 'ماجستير'),
    S2Choice<String>(value: '10', title: 'دكتوراه'),
  ];

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