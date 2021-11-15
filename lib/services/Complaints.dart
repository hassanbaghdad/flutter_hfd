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
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

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


Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
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

     File  soldier_id_front =new File("");
     File  soldier_id_back=new File("");
   File  husband_id_front=new File("");
   File  husband_id_back=new File("");
   File  child_id_front=new File("");
   File  child_id_back=new File("");
   File contract=new File("");
   File  long_card=new File("");
   File  resident_card_front=new File("");
   File  resident_card_back=new File("");

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
  bool haveChildren = false;
   checkChildrenCount(String str)
  {
    try{
      if(int.parse(str) > 0 )
      {
        setState(() {
          haveChildren = true;
        });

      }
    }catch(e)
    {
      setState(() {
        haveChildren = false;
      });
    }

  }
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
   
    //complaint_soldier_qi.text = "6330159718063060";


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
                model.complaint_type!='موضوع الشكوى'?Column(children: <Widget>[
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
                        DropdownMaritalState(context),
                        model.marital_state =='متزوج/ة'?Textbox("اسم الزوج/ة", Icon(Mdi.humanFemale),husband_name):SizedBox(),
                        model.marital_state =='متزوج/ة'?Textbox("الحالة الوظيفية للزوج/ة", Icon(Mdi.humanFemale),job_state):SizedBox(),
                        model.marital_state =='متزوج/ة'?DropdownWifesCount(context):SizedBox(),
                        model.marital_state !='اعزب/باكر'?DropdownChildrenCount(context):SizedBox(),
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
                        DropdownLearn(context),
                        model.complaint_type!=''&& model.academic =='دبلوم' || model.academic =='بكالوريوس' || model.academic =='ماجستير' ||model.academic =='دكتوراه'? Textbox("الجامعة", Icon(Icons.apartment),university):SizedBox(),
                        model.complaint_type!=''&& model.academic =='دبلوم' || model.academic =='بكالوريوس' || model.academic =='ماجستير' ||model.academic =='دكتوراه'? Textbox("الكلية", Icon(Icons.apartment),college):SizedBox(),
                        model.complaint_type!=''&& model.academic =='دبلوم' || model.academic =='بكالوريوس' || model.academic =='ماجستير' ||model.academic =='دكتوراه'?Textbox("الاختصاص", Icon(Icons.apartment),purview):SizedBox(),
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
                        DropdownCity(context),
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
                        DropdownReligion(context),
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
                        DropdownIdType(context),
                        model.id_type=='البطاقة الوطنية الموحدة'?Textbox("رقم البطاقة", Icon(Icons.credit_card),nat_id_no):SizedBox(),
                        model.id_type=='البطاقة الوطنية الموحدة'?Textbox("جهة الاصدار", Icon(Icons.info),nat_id_issuer):SizedBox(),
                        model.id_type=='هوية الاحوال المدنية'?Textbox("رقم الهوية", Icon(Icons.credit_card),civil_id_no):SizedBox(),
                        model.id_type=='هوية الاحوال المدنية'?Textbox("تاريخ الاصدار ", Icon(Icons.credit_card),civil_issuer_date):SizedBox(),
                        model.id_type=='هوية الاحوال المدنية'?Textbox("رقم الصحيفة", Icon(Icons.info),civil_id_newspaper_no):SizedBox(),
                        model.id_type=='هوية الاحوال المدنية'?Textbox("رقم السجل", Icon(Icons.info),civil_record_no):SizedBox(),
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
                        DatePicker(residence_card_date.text, "تاريخ الاصدار"),
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
                        SetDoc("وجه جنسية او هوية المقاتل", "https://hfd.gov.iq/img/1.0d223e24.png", soldier_id_front, pickCameraSoldierIdFront, pickGallerySoldierIdFront),
                        SetDoc("ظهر جنسية او هوية المقاتل", "https://hfd.gov.iq/img/2.86098a9a.png", soldier_id_back, pickCameraSoldierIdBack, pickGallerySoldierIdBack),
                        model.marital_state =='متزوج/ة' && int.parse(model.wifes_count) > 0?SetDoc("وجه جنسية او هوية الزوج/ة", "https://hfd.gov.iq/img/1.0d223e24.png", husband_id_front, pickCameraHusbandIdFront, pickGalleryHusbandIdFront):SizedBox(),
                        model.marital_state =='متزوج/ة' && int.parse(model.wifes_count) > 0?SetDoc("وجه جنسية او هوية الزوج/ة", "https://hfd.gov.iq/img/2.86098a9a.png", husband_id_back, pickCameraHusbandIdBack, pickGalleryHusbandIdBack):SizedBox(),
                        int.parse(model.children_count) > 0 ?SetDoc("وجه جنسية او هوية الطفل", "https://hfd.gov.iq/img/1.0d223e24.png", child_id_front, pickCameraChildIdFront, pickGalleryChildIdFront):SizedBox(),
                        int.parse(model.children_count) > 0?SetDoc("ظهر جنسية او هوية الطفل", "https://hfd.gov.iq/img/2.86098a9a.png", child_id_back, pickCameraChildIdBack, pickGalleryChildIdBack):SizedBox(),
                        SetDoc("وجه بطاقة السكن", "https://hfd.gov.iq/img/4.486ee720.png", resident_card_front, pickCameraResidenceFront, pickGalleryResidenceFront),
                        SetDoc("ظهر بطاقة السكن", "https://hfd.gov.iq/img/6.1ded7f67.png", resident_card_back, pickCameraResidenceBack, pickGalleryResidenceBack),
                        SetDoc("عقد الزواج", "https://hfd.gov.iq/img/3.aca66164.png", contract, pickCameraContract, pickGalleryContract),
                        SetDoc("البطاقة التموينية", "https://hfd.gov.iq/img/5.022d1913.png", long_card, pickCameraLongCard, pickGalleryLongCard),

                      ],
                    ),
                  ):SizedBox(),
                  Container(
                    color: Colors.blue,
                    width: double.infinity,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: sending==false?Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.send,color: Colors.white),
                          Text("ارسال",style: TextStyle(fontSize: 18,color: Colors.white),)
                        ],
                      ):CircularProgressIndicator(color: Colors.white,),
                      onPressed: () {
                        print(model.academic);

                        if (_formKey.currentState!.validate()) {
                          sendComplaint();
                        }
                      },
                    ),
                  )
                ],):SizedBox()

              ],
            ),
          )),
    );
  }

  Container DropdownComplaintType(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
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
        width:double.infinity,
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
  Container DropdownWifesCount(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.wifes_count,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("عدد الزوجات"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeWifesCount(newValue);
            });
          },
          items: <String>[
            '0','1','2','3','4'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
  Container DropdownChildrenCount(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.children_count,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("عدد الاطفال"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeChildrenCount(newValue);
            });
          },
          items: <String>[
            '0','1','2','3','4','5','6','7','8','9','10','11','12'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
  Container DropdownCity(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.city,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("المحافظة الحالية"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeCity(newValue);
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
  Container DropdownMaritalState(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.marital_state,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("الحالة الزوجية"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeMaritalState(newValue);
              print(newValue);
            });
          },
          items: <String>[
            'اعزب/باكر',
            'متزوج/ة',
            'مطلق/ة',
            'ارمل/ة',


          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
  Container DropdownLearn(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.academic,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("الشهادة"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeLearn(newValue);
            });
          },
          items: <String>[
            'أمي',
            'يقرأ ويكتب',
            'ابندائية',
            'متوسطة',
            'اعدادية',
            'حوزوي',
            'دبلوم',
            'بكالوريوس',
            'ماجستير',
            'دكتوراه',


          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
  Container DropdownReligion(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.religion,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("الديانة"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeReligion(newValue);
            });
          },
          items: <String>[
            'مسلم',
            'مسيحي',
            'صابئي',
            'ايزيدي',
            'شبك',
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
  Container DropdownIdType(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Container(
        width:double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: DropdownButton<String>(
          value: model.id_type,
          elevation: 16,
          alignment: Alignment.center,
          style: const TextStyle(color: Colors.green,fontSize: 18,),
          hint: Text("نوع الهوية"),

          underline: Container(
            height: 0,
            alignment: Alignment.center,
          ),
          onChanged: (String? newValue) {
            setState(() {
              model.changeIdType(newValue);
            });
          },
          items: <String>[
            'هوية الاحوال المدنية',
            'البطاقة الوطنية الموحدة',


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

  Column SetDoc(String _title, String _url,File doc,Future pickCamera(),Future pickGallery()) {
    return Column(children: <Widget>[
      Container(
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
              child: doc.path!=""?Image.file(doc):Image.network(_url),
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
      ),
      Divider(thickness: 1,)
    ],);
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
     setState(() {
       sending = true;
     });
     var model = Provider.of<Model>(context,listen: false);
     // for(int i = 0 ; i<=6 ; i++)
     // {
     //   Codec<String, String> stringToBase64 = utf8.fuse(base64);
     //   complaint_soldier_qi.text = stringToBase64.encode(complaint_soldier_qi.text);
     // }
     //complaint_soldier_qi.text = "6330153529002144";
     var url =Server.con + "/api-mobile/services/send-complaints";

     var request = http.MultipartRequest('POST',Uri.parse(url));
     request.fields['complaint_soldier_qi'] = complaint_soldier_qi.text;
     request.fields['complaint_type'] = model.complaint_type;
     request.fields['complaint_soldier_name'] = complaint_soldier_name.text;
     request.fields['mother_name'] = mother_name.text;
     request.fields['formation'] = formation.text;
     request.fields['complaint_soldier_phone'] = complaint_soldier_phone.text;
     request.fields['place_birthday'] =model.place_birthday;
     request.fields['birthday_date'] =birthday_date.text;
     request.fields['marital_state'] =model.marital_state;
     request.fields['husband_name'] =husband_name.text;
     request.fields['job_state'] =job_state.text;
     request.fields['wifes_count'] =model.wifes_count;
     request.fields['children_count'] =model.children_count;
     request.fields['academic'] =model.academic;
     request.fields['purview'] =academic.text;
     request.fields['university'] =university.text;
     request.fields['college'] =college.text;
     request.fields['section'] =section.text;
     request.fields['city'] =model.city;
     request.fields['area'] =area.text;
     request.fields['nearest_point'] =nearest_point.text;
     request.fields['last_job'] =last_job.text;
     request.fields['religion'] =model.religion;
     request.fields['id_type'] =model.id_type;
     request.fields['nat_id_no'] =nat_id_no.text;
     request.fields['nat_id_date'] =nat_id_date.text;
     request.fields['nat_id_issuer'] =nat_id_issuer.text;
     request.fields['civil_id_no'] =civil_id_no.text;
     request.fields['civil_id_newspaper_no'] =civil_id_newspaper_no.text;
     request.fields['civil_record_no'] =civil_record_no.text;
     request.fields['civil_issuer_date'] =civil_issuer_date.text;
     request.fields['residence_card_no'] =residence_card_no.text;
     request.fields['residence_card_date'] =model.residence_card_date;



     request.files.add(await http.MultipartFile.fromPath("soldier_id_front",soldier_id_front.path));
     request.files.add(await http.MultipartFile.fromPath("soldier_id_back", soldier_id_back.path));
     if(model.marital_state =='متزوج/ة')
     {
       request.files.add(await http.MultipartFile.fromPath("husband_id_front", husband_id_front.path));
       request.files.add(await http.MultipartFile.fromPath("husband_id_back", husband_id_back.path));
     }
     if(int.parse(model.children_count) > 0)
     {
       request.files.add(await http.MultipartFile.fromPath("child_id_front", child_id_front.path));
       request.files.add(await http.MultipartFile.fromPath("child_id_back", child_id_back.path));
     }


     request.files.add(await http.MultipartFile.fromPath("residence_card_front", resident_card_front.path));
     request.files.add(await http.MultipartFile.fromPath("residence_card_back", resident_card_back.path));
     request.files.add(await http.MultipartFile.fromPath("contract", contract.path));
     request.files.add(await http.MultipartFile.fromPath("long_card", long_card.path));


     request.headers.addAll({
       'Content-Type': 'application/json; charset=UTF-8'
     });

     var streamedResponse = await request.send();
     var response = await http.Response.fromStream(streamedResponse);

     print(response.body);
     final res = jsonDecode(response.body);
     print(res);
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
     setState(() {
       sending = false;
     });
   }catch(ex)
    {
      Fluttertoast.showToast(
        msg: ex.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 18,
      );
      setState(() {
        sending = false;
      });
    }
  }


}
