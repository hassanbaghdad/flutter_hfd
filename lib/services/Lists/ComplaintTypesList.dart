import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
class ComplaintTypesList {

  List<S2Choice<String>> complaint_types = [
    S2Choice<String>(value: '1', title: 'شهيد'),
    S2Choice<String>(value: '2', title: 'جريح'),
    S2Choice<String>(value: '3', title: 'ايقاف راتب'),
    S2Choice<String>(value: '4', title: 'مخصصات'),
    S2Choice<String>(value: '5', title: 'نفقة'),
    S2Choice<String>(value: '6', title: 'بطاقة كي كارد'),
    S2Choice<String>(value: '7', title: 'اخرى'),
  ];
}
