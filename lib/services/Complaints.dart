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
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'Lists/CitiesList.dart';
import 'package:mdi/mdi.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ChangeNotifierProvider(
          create: (context) => Model(),
          child: scaf(),
        ));
  }
}

class scaf extends StatefulWidget {
  @override
  _scafState createState() => _scafState();
}

class _scafState extends State<scaf> {
  late File file;

  Future chooseImage() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      file = File(myfile!.path);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    var form = _formKey.currentState;

      print(_formKey);

  }

  TextEditingController birthday_date = new TextEditingController();
  TextEditingController id_nat_date = new TextEditingController();
  TextEditingController id_civil_date = new TextEditingController();
  TextEditingController resident_card_date = new TextEditingController();

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
                      Textbox("اسم المقاتل الرباعي", Icon(Icons.person)),
                      Textbox("اسم الام الثلاثي", Icon(Icons.info)),
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
                      Textbox("الجامعة", Icon(Icons.apartment)),
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
                      Divider(thickness: 1,),
                      TileImage("وجه جنسية او هوية المقاتل","https://hfd.gov.iq/img/1.0d223e24.png"),
                      Divider(thickness: 1,),
                      TileImage("ظهر جنسية او هوية المقاتل","https://hfd.gov.iq/img/2.86098a9a.png"),
                      Divider(thickness: 1,),
                      TileImage("وجه جنسية او هوية الزوج/ة","https://hfd.gov.iq/img/1.0d223e24.png"),
                      Divider(thickness: 1,),
                      TileImage("ظهر جنسية او هوية الزوج/ة","https://hfd.gov.iq/img/2.86098a9a.png"),
                      Divider(thickness: 1,),
                      TileImage("وجه بطاقة السكن","https://hfd.gov.iq/img/4.486ee720.png"),
                      Divider(thickness: 1,),
                      TileImage("ظهر بطاقة السكن","https://hfd.gov.iq/img/6.1ded7f67.png"),

                    ],
                  ),
                ),
                
                Container(
                  child: RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Text("ارسال")
                      ],
                    ),
                    onPressed: (){
                      validateAndSave();
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  ListTile TileImage(String _title , String _url) {
    return ListTile(
                      leading: Container(child: Image.network(_url),padding: EdgeInsets.all(5),width: 60,),
                      title:Text(_title),
                      trailing: Container(child: IconButton(icon: Icon(Icons.image),onPressed: (){
                        chooseImage();
                      },)),
                    );
  }

  Container Datepiker(
      BuildContext context, TextEditingController _controller, _label) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _controller,
        readOnly: true,
        onTap: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1930, 1, 1),
              maxTime: DateTime(2005, 12, 1), onChanged: (date) {
            print('change $date');
            _controller.text = date.toString();
          }, onConfirm: (date) {
            print('confirm $date');
            _controller.text = date.toString().substring(0, 10);
          }, currentTime: DateTime.now(), locale: LocaleType.ar);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
            label: Text(_label),
            prefixIcon: Icon(Icons.date_range)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container Textbox(String _label, Icon _icon) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
            label: Text(_label),
            //prefixIcon: _icon
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container Selector(dynamic model, dynamic _items, String _title) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SmartSelect<String>.single(
        title: _title,
        value: model,
        choiceItems: _items,
        placeholder: "اختر",
        modalType: S2ModalType.popupDialog,
        onChange: (state) => setState(() => {
              //Model().changeComplaintType(state.value),
              print(state.value)
            }),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
      ),
    );
  }
}
