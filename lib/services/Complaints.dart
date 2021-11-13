import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hfd_flutter/Server.dart';
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
final _formKey = new GlobalKey<FormState>();
final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
class scaf extends StatefulWidget {
  @override
  _scafState createState() => _scafState();
}

class _scafState extends State<scaf> {


  String msg = "Send";
  bool sending = false;

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

   File soldier_id_front = File("");
   File  soldier_id_back= File("");
   File  husband_id_front= File("");
   File  husband_id_back= File("");
   File  child_id_front= File("");
   File  child_id_back= File("");
   File  contract= File("");
   File  long_card= File("");
   File  resident_card_front= File("");
   File  resident_card_back= File("");

  Future pickCameraSoldierIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      soldier_id_front = File(myfile!.path);
      print(soldier_id_front);
    });
  }
  Future pickGallerySoldierIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      soldier_id_front = File(myfile!.path);
    });
  }
  Future pickCameraSoldierIdBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      soldier_id_back = File(myfile!.path);
    });
  }
  Future pickGallerySoldierIdBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      soldier_id_back = File(myfile!.path);
    });
  }
  Future pickCameraHusbandIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      husband_id_front = File(myfile!.path);
    });
  }
  Future pickGalleryHusbandIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      husband_id_front= File(myfile!.path);
    });
  }
  Future pickCameraHusbandIdBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      husband_id_back = File(myfile!.path);
    });
  }
  Future pickGalleryHusbandIdBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      husband_id_back = File(myfile!.path);
    });
  }
  Future pickCameraChildIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      child_id_front = File(myfile!.path);
    });
  }
  Future pickGalleryChildIdBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      child_id_back = File(myfile!.path);
    });
  }
  Future pickCameraChildIdBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      child_id_back = File(myfile!.path);
    });
  }
  Future pickGalleryChildIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      child_id_front = File(myfile!.path);
    });
  }

  Future pickCameraResidenceFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      resident_card_front = File(myfile!.path);
    });
  }
  Future pickGalleryResidenceFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      resident_card_front = File(myfile!.path);
    });
  }
  Future pickCameraResidenceBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      resident_card_back = File(myfile!.path);
    });
  }
  Future pickGalleryResidenceBack() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      resident_card_back = File(myfile!.path);
    });
  }

  Future pickCameraContract() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      contract = File(myfile!.path);
    });
  }
  Future pickGalleryContract() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      contract = File(myfile!.path);
    });
  }
  Future pickCameraLongCard() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      long_card = File(myfile!.path);
    });
  }
  Future pickGalleryLongCard() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      long_card = File(myfile!.path);
    });
  }

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
   
    complaint_soldier_qi.text = "6330154504416036";
    String _email;
    String _password;

    String status = '';
    String base64Image;

    String errMessage = 'Error Uploading Image';

    var model = Provider.of<Model>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("شكاوي المجاهدين"),
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
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('معلومات المقاتل'),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                        controller: complaint_soldier_name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'لايمكن ترك هذا الحقل فارغا';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                          label: Text("اسم المقاتل"),
                          //prefixIcon: _icon
                        ),
                        textAlign: TextAlign.center,
                      ),),
                     Textbox("اسم الام الثلاثي", Icon(Icons.info),mother_name),
                      model.complaint_type=='مخصصات'?DropdownPlaceBirthday(context):SizedBox(),
                      model.complaint_type=='مخصصات'?DatePicker(model.birthday_date, "المواليد"):SizedBox(),
                      Textbox("رقم الهاتف", Icon(Icons.phone),complaint_soldier_phone),
                      Textbox("اسم التشكيل", Icon(Icons.info),formation),
                      Textbox("رقم بطاقة الكي كارد", Icon(Icons.credit_card),complaint_soldier_qi),
                    ],
                  ),
                ),
                model.complaint_type=='مخصصات'?Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('معلومات الزوجية'),
                      Textbox("عدد الزوجات", Icon(Mdi.humanFemale),wifes_count),
                      Textbox("عدد الاطفال", Icon(Icons.info),children_count),
                    ],
                  ),
                ):SizedBox(),
                model.complaint_type=='مخصصات'?Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('التعليم'),
                      Textbox("الكلية", Icon(Icons.apartment),college),
                      Textbox("الاختصاص", Icon(Icons.apartment),purview),
                    ],
                  ),
                ):SizedBox(),
                model.complaint_type=='مخصصات'?Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('عنوان السكن الحالي'),

                      Textbox("المنطقة", Icon(Mdi.map),area),
                      Textbox(
                          "اقرب نقطة دالة", Icon(Icons.add_location_rounded),nearest_point),
                    ],
                  ),
                ):SizedBox(),
                model.complaint_type=='مخصصات'?Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('العمل السابق والديانة'),
                     Textbox("العمل السابق", Icon(Icons.info),last_job),
                    ],
                  ),
                ):SizedBox(),
                model.complaint_type=='مخصصات'?Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('المعلمومات الشخصية'),

                      Textbox("رقم البطاقة", Icon(Icons.credit_card),nat_id_no),
                      Textbox("جهة الاصدار", Icon(Icons.info),nat_id_issuer),
                      Textbox("رقم الهوية", Icon(Icons.credit_card),civil_id_no),
                      Textbox("رقم الصحيفة", Icon(Icons.info),civil_id_newspaper_no),
                      Textbox("رقم السجل", Icon(Icons.info),civil_record_no),
                    ],
                  ),
                ):SizedBox(),
                model.complaint_type=='مخصصات'? Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Column(
                    children: <Widget>[
                      Text('بطاقة السكن'),
                      Textbox("رقم البطاقة", Icon(Icons.credit_card),residence_card_no),
                      DatePicker(model.residence_card_date, "المواليد"),
                    ],
                  ),
                ):SizedBox(),
                model.complaint_type=='مخصصات'?Container(
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
                      SetDoc("وجه جنسية او هوية المقاتل", "https://hfd.gov.iq/img/1.0d223e24.png", soldier_id_front, pickCameraSoldierIdFront, pickGallerySoldierIdFront), Divider(thickness: 1,),
                      SetDoc("ظهر جنسية او هوية المقاتل", "https://hfd.gov.iq/img/2.86098a9a.png", soldier_id_back, pickCameraSoldierIdBack, pickGallerySoldierIdBack), Divider(thickness: 1,),
                      SetDoc("وجه جنسية او هوية الزوج/ة", "https://hfd.gov.iq/img/1.0d223e24.png", husband_id_front, pickCameraHusbandIdFront, pickGalleryHusbandIdFront), Divider(thickness: 1,),
                      SetDoc("وجه جنسية او هوية الزوج/ة", "https://hfd.gov.iq/img/2.86098a9a.png", husband_id_back, pickCameraHusbandIdBack, pickGalleryHusbandIdBack), Divider(thickness: 1,),
                      SetDoc("وجه جنسية او هوية الطفل", "https://hfd.gov.iq/img/1.0d223e24.png", child_id_front, pickCameraChildIdFront, pickGalleryChildIdFront), Divider(thickness: 1,),
                      SetDoc("ظهر جنسية او هوية الطفل", "https://hfd.gov.iq/img/2.86098a9a.png", child_id_back, pickCameraChildIdBack, pickGalleryChildIdBack), Divider(thickness: 1,),
                      SetDoc("وجه بطاقة السكن", "https://hfd.gov.iq/img/4.486ee720.png", resident_card_front, pickCameraResidenceFront, pickGalleryResidenceFront), Divider(thickness: 1,),
                      SetDoc("ظهر بطاقة السكن", "https://hfd.gov.iq/img/6.1ded7f67.png", resident_card_back, pickCameraResidenceBack, pickGalleryResidenceBack), Divider(thickness: 1,),
                      SetDoc("عقد الزواج", "https://hfd.gov.iq/img/3.aca66164.png", contract, pickCameraContract, pickGalleryContract), Divider(thickness: 1,),
                      SetDoc("البطاقة التموينية", "https://hfd.gov.iq/img/5.022d1913.png", long_card, pickCameraLongCard, pickGalleryLongCard), Divider(thickness: 1,),


                      // TileImage("ظهر جنسية او هوية المقاتل",
                      //     "https://hfd.gov.iq/img/2.86098a9a.png"),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      // TileImage("وجه جنسية او هوية الزوج/ة",
                      //     "https://hfd.gov.iq/img/1.0d223e24.png"),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      // TileImage("ظهر جنسية او هوية الزوج/ة",
                      //     "https://hfd.gov.iq/img/2.86098a9a.png"),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      // TileImage("وجه بطاقة السكن",
                      //     "https://hfd.gov.iq/img/4.486ee720.png"),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      // TileImage("ظهر بطاقة السكن",
                      //     "https://hfd.gov.iq/img/6.1ded7f67.png"),
                    ],
                  ),
                ):SizedBox(),

                // simple usage

                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: sending?CircularProgressIndicator(color: Colors.white,):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.send,color: Colors.white),
                        Text("ارسال",style: TextStyle(fontSize: 18,color: Colors.white),)
                      ],
                    ),
                    onPressed: () {
                      print(model.academic);

                      if (_formKey.currentState!.validate()) {
                        sendComplaint();
                      }
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
        width:300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.complaint_type,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeComplaintType(newValue);
            });
          },
          items: <String>[
            'موضوع الشكوى',
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
  Container DropdownPlaceBirthday(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.place_birthday,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("محل الولادة"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changePlaceBirthday(newValue);
            });
          },
          items: <String>[
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


  Container SetDoc(String _title, String _url,dynamic doc,Future pickCamera(),Future pickGallery()) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1)
      ),
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Expanded(child: Container(
            height: 80,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width /3.2,
            child: doc!=""?Image.file(doc):Image.network(_url),
          ),),
          Container(
            child: Text(_title),
            width: MediaQuery.of(context).size.width /3.2,
          ),
          Container(
            width: MediaQuery.of(context).size.width /3.2,
            child: Column(
              children: <Widget>[
                IconButton(onPressed: (){
                  pickCamera();
                }, icon: Icon(Icons.camera_alt_rounded)),
                IconButton(onPressed: (){
                  pickGallery();
                }, icon: Icon(Icons.image)),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Container Textbox(String _label, Icon _icon , TextEditingController _controller) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _controller,
        autofocus: _label=='اسم المقاتل الرباعي'?true:false,
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

   sendComplaint() async
  {
    try{
      var model = Provider.of<Model>(context,listen: false);
      setState(() {
        sending = true;
      });

      for(int i = 0 ; i<=6 ; i++)
      {
        Codec<String, String> stringToBase64 = utf8.fuse(base64);
        complaint_soldier_qi.text = stringToBase64.encode(complaint_soldier_qi.text);

      }
      print(complaint_soldier_qi.text);
      var url =Server.con + "/api-site/services/send-complaints";
      var response = await http.post(Uri.parse(url),body: jsonEncode(<String, String>{
        'complaint_type':model.complaint_type,
        'complaint_soldier_name':complaint_soldier_name.text,
        'complaint_soldier_qi':complaint_soldier_qi.text,
        'mother_name':mother_name.text,
        'formation':formation.text,
        'complaint_text':complaint_text.text,
        'soldier_id_front':base64Encode(soldier_id_front.readAsBytesSync()),
        'soldier_id_back':base64Encode(soldier_id_back.readAsBytesSync()),
        'husband_id_front':base64Encode(husband_id_front.readAsBytesSync()),
        'husband_id_back':base64Encode(husband_id_back.readAsBytesSync()),
        'child_id_front':base64Encode(child_id_front.readAsBytesSync()),
        'child_id_back':base64Encode(child_id_back.readAsBytesSync()),
        'residence_card_front':base64Encode(resident_card_front.readAsBytesSync()),
        'residence_card_back':base64Encode(resident_card_back.readAsBytesSync()),
        'contract':base64Encode(contract.readAsBytesSync()),
        'long_card':base64Encode(long_card.readAsBytesSync()),

      }),headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);
      print(response.body);
      var res = jsonDecode(response.body);
      setState(() {
        msg = res["msg"];
      });
      if(res["msg"] =="تم الارسال بنجاح")
        {
          Navigator.of(context).pushNamed("send_complaint_success");
        }
      // msg = response.body;
      Fluttertoast.showToast(
        msg: res["msg"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18,
      );
      sending = false;
    }catch(e)
    {
      sending = false;
      print(e);
    }finally{
      sending = false;
    }
  }


}
