import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hfd_flutter/services/Lists/ComplaintTypesList.dart';
import 'package:hfd_flutter/services/Lists/Lists.dart';
import 'package:hfd_flutter/services/Store/ComplaintStore.dart';
import 'package:smart_select/smart_select.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'Lists/CitiesList.dart';
import 'package:mdi/mdi.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: scaf(),
    );
  }
}

class scaf extends StatefulWidget {
  @override
  _scafState createState() => _scafState();
}

class _scafState extends State<scaf> {
  late File file;

  Future chooseImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      file = File(myfile!.path);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController complaint_text = new TextEditingController();
  TextEditingController complaint_soldier_name = new TextEditingController();
  TextEditingController mother_name = new TextEditingController();
  TextEditingController complaint_soldier_qi = new TextEditingController();
  TextEditingController complaint_soldier_phone = new TextEditingController();
  TextEditingController formation = new TextEditingController();
  TextEditingController place_birthday = new TextEditingController();
  TextEditingController birthday_date = new TextEditingController();
  TextEditingController marital_state = new TextEditingController();
  TextEditingController husband_name = new TextEditingController();
  TextEditingController job_state = new TextEditingController();
  TextEditingController wifes_count = new TextEditingController();
  TextEditingController children_count = new TextEditingController();
  TextEditingController academic = new TextEditingController();
  TextEditingController purview = new TextEditingController();
  TextEditingController university = new TextEditingController();
  TextEditingController college = new TextEditingController();
  TextEditingController section = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController nearest_point = new TextEditingController();
  TextEditingController last_job = new TextEditingController();
  TextEditingController religion = new TextEditingController();
  TextEditingController id_type = new TextEditingController();
  TextEditingController nat_id_no = new TextEditingController();
  TextEditingController nat_id_date = new TextEditingController();
  TextEditingController nat_id_issuer = new TextEditingController();
  TextEditingController civil_id_no = new TextEditingController();
  TextEditingController civil_id_newspaper_no = new TextEditingController();
  TextEditingController civil_record_no = new TextEditingController();
  TextEditingController civil_issuer_date = new TextEditingController();
  TextEditingController residence_card_no = new TextEditingController();
  TextEditingController residence_card_date = new TextEditingController();

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
  String value = 'flutter';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];
  String learn = "One";

  @override
  Widget build(BuildContext context) {
    final _formKey = new GlobalKey<FormState>();
    String _email;
    String _password;

    String status = '';
    String base64Image;

    String errMessage = 'Error Uploading Image';

    var model = Provider.of<Model>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.text}"),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('نوع الشكوى'),
                      DropdownComplaintType(context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('معلومات المقاتل'),
                      model.complaint_type=='نفقة'?Textbox("اسم المقاتل الرباعي", Icon(Icons.person)):Text(""),
                      Textbox("اسم الام الثلاثي", Icon(Icons.info)),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: SmartSelector(
                            model.place_birthday, model.cities, "محل الولادة"),
                      ),
                      DatePicker(model.birthday_date, "المواليد"),
                      Textbox("رقم الهاتف", Icon(Icons.phone)),
                      Textbox("اسم التشكيل", Icon(Icons.info)),
                      Textbox("رقم بطاقة الكي كارد", Icon(Icons.credit_card)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('معلومات الزوجية'),
                      Textbox("عدد الزوجات", Icon(Mdi.humanFemale)),
                      Textbox("عدد الاطفال", Icon(Icons.info)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('التعليم'),
                      // simple usage



                      Textbox("الكلية", Icon(Icons.apartment)),
                      Textbox("الاختصاص", Icon(Icons.apartment)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('عنوان السكن الحالي'),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child:
                            SmartSelector(model.city, model.cities, "المحافظة"),
                      ),
                      Textbox("المنطقة", Icon(Mdi.map)),
                      Textbox(
                          "اقرب نقطة دالة", Icon(Icons.add_location_rounded)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('العمل السابق والديانة'),
                      Textbox("العمل السابق", Icon(Icons.info)),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: SmartSelector(
                            model.religion, model.religions, "الديانة"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('المعلمومات الشخصية'),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: SmartSelector(
                            model.id_type, model.id_types, "نوع الهوية"),
                      ),
                      Textbox("رقم البطاقة", Icon(Icons.credit_card)),
                      Textbox("جهة الاصدار", Icon(Icons.info)),
                      Textbox("رقم الهوية", Icon(Icons.credit_card)),
                      Textbox("رقم الصحيفة", Icon(Icons.info)),
                      Textbox("رقم السجل", Icon(Icons.info)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('بطاقة السكن'),
                      Textbox("رقم البطاقة", Icon(Icons.credit_card)),
                      DatePicker(model.residence_card_date, "المواليد"),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('اضافة مستمسكات'),
                      Divider(
                        thickness: 1,
                      ),
                      TileImage("وجه جنسية او هوية المقاتل",
                          "https://hfd.gov.iq/img/1.0d223e24.png"),
                      Divider(
                        thickness: 1,
                      ),
                      TileImage("ظهر جنسية او هوية المقاتل",
                          "https://hfd.gov.iq/img/2.86098a9a.png"),
                      Divider(
                        thickness: 1,
                      ),
                      TileImage("وجه جنسية او هوية الزوج/ة",
                          "https://hfd.gov.iq/img/1.0d223e24.png"),
                      Divider(
                        thickness: 1,
                      ),
                      TileImage("ظهر جنسية او هوية الزوج/ة",
                          "https://hfd.gov.iq/img/2.86098a9a.png"),
                      Divider(
                        thickness: 1,
                      ),
                      TileImage("وجه بطاقة السكن",
                          "https://hfd.gov.iq/img/4.486ee720.png"),
                      Divider(
                        thickness: 1,
                      ),
                      TileImage("ظهر بطاقة السكن",
                          "https://hfd.gov.iq/img/6.1ded7f67.png"),
                    ],
                  ),
                ),
                // simple usage

                Container(
                  child: RaisedButton(
                    child: Row(
                      children: <Widget>[Text("ارسال")],
                    ),
                    onPressed: () {
                      print(model.academic);
                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Processing Data')),
                      //   );
                      // }
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  Container DropdownComplaintType(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.complaint_type,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          underline: Container(
            height: 2,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeComplaintType(newValue);
            });
          },
          items: <String>[
            'شهيد',
            'جريح',
            'ايقاف راتب',
            'مخصصات',
            'نفقة',
            'بطاقة كي كارد',
            'اخرى',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }

  Container DatePicker(dynamic _value, String _title) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: DateTimePicker(
        initialValue: '',
        firstDate: DateTime(1920),
        lastDate: DateTime(2030),
        dateMask: 'yyyy-MM-dd',
        dateLabelText: _title,
        icon: Icon(Icons.event),
        onChanged: (val) => {
          _value = val.toString(),
        },
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) => {_value = val.toString()},
      ),
    );
  }

  SmartSelect<String> SmartSelector(dynamic model_value, dynamic model_list, String _title) {
    return SmartSelect<String>.single(
        title: _title,
        placeholder: "اختر",
        value: model_value,
        choiceItems: model_list,
        onChange: (state) {
          model_value = state.value;

          print(model_value);
        });
  }

  ListTile TileImage(String _title, String _url) {
    return ListTile(
      leading: Container(
        child: Image.network(_url),
        padding: EdgeInsets.all(5),
        width: 60,
      ),
      title: Text(_title),
      trailing: Container(
          child: IconButton(
        icon: Icon(Icons.image),
        onPressed: () {
          chooseImage();
        },
      )),
    );
  }

  Container Textbox(String _label, Icon _icon) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'لايمكن ترك هذا الحقل فارغا';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
          label: Text(_label),
          //prefixIcon: _icon
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
