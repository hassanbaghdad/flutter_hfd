
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hfd_flutter/models/complaintsModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';


class SendComplaints extends StatelessWidget {
  var _model = ComplaintsModel();
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("شكاوي المجاهدين"),
      ),
      body: ChangeNotifierProvider(create: (context) => _model,child: ListView(children: [
        smartSelect('نوع الشكوى',_model.complaint_type,_model.complaintTypes,''),
         //معلومات المقاتل
         Container(
          width:double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child:Column(children: [
            Text('معلومات المقاتل'),
            aTextBox("اسم المقاتل الرباعي واللقب",_model.complaint_soldier_name,TextInputType.text,''),
            aTextBox("اسم الام الثلاثي",_model.mother_name,TextInputType.text,'مخصصات'),
            smartSelect('محل الولادة',_model.place_birthday,_model.cities,'مخصصات'),
            aDatePiker(context,'المواليد',_model.birthday_date),
            aTextBox("رقم الهاتف",_model.complaint_soldier_phone,TextInputType.phone,''),
            aTextBox("اسم التشكيل",_model.formation,TextInputType.text,''),
            aTextBox("رقم الكي كارد",_model.complaint_soldier_qi,TextInputType.number,''),
          ],)
        ),
         Consumer<ComplaintsModel>(builder: (context, model2, child){
           if(model2.complaint_type !='مخصصات')
             {
               return SizedBox();
             }else{
             return Column(children: [
               //الحالة الزوجية
               Container(
                   width:double.infinity,
                   margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                   child:Column(children: [
                     Text('معلومات الزوجية '),
                     smartSelect('الحالة الزوجية',_model.marital_state,_model.maritalState,'مخصصات'),
                     aTextBox("اسم الزوج/ة الثلاثي",_model.husband_name,TextInputType.text,'مخصصات'),
                     aTextBox("عمل الزوج/ة",_model.job_state,TextInputType.text,'مخصصات'),
                     aTextBox("عدد الزوجات",_model.wifes_count,TextInputType.number,'مخصصات'),
                     aTextBox("اعدد الاطفال",_model.children_count,TextInputType.number,'مخصصات'),
                   ])
               ),
               //التعليم
               Container(
                   width:double.infinity,
                   margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                   child:Column(children: [
                     Text('التعليم'),
                     smartSelect('التعليم',_model.academic,_model.learns,'مخصصات'),
                     aTextBox("الجامعة",_model.university,TextInputType.text,'مخصصات'),
                     aTextBox("الكلية",_model.college,TextInputType.text,'مخصصات'),
                     aTextBox("القسم",_model.section,TextInputType.text,'مخصصات'),
                     aTextBox("الاختصاص",_model.purview,TextInputType.text,'مخصصات'),
                   ])
               ),

               //معلومات السكن
               Container(
                   width:double.infinity,
                   margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                   child:Column(children: [
                     Text('معلومات السكن'),
                     smartSelect('المحافظة الحالية',_model.city,_model.cities,'مخصصات'),
                     aTextBox("المنطقة",_model.area,TextInputType.text,'مخصصات'),
                     aTextBox("اقرب نقطة دالة",_model.nearest_point,TextInputType.text,'مخصصات'),

                   ])
               ),
               //العمل السابق والديانة
               Container(
                   width:double.infinity,
                   margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                   child:Column(children: [
                     Text('الديانة والعمل السابق'),
                     smartSelect('الديانة',_model.religion,_model.religions,'مخصصات'),
                     aTextBox("العمل السابق",_model.last_job,TextInputType.text,'مخصصات'),
                   ])
               ),
               //معلومات الهوية
               Container(
                   width:double.infinity,
                   margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                   child:Column(children: [
                     Text('معلومات الهوية'),
                     smartSelect('نوع الهوية',_model.id_type,_model.idtypes,'مخصصات'),
                     aTextBox("رقم الهوية",_model.civil_id_no,TextInputType.number,'مخصصات'),
                     aDatePiker(context,'تاريخ الاصدار',_model.civil_issuer_date),
                     aTextBox("رقم الصحيفة",_model.civil_id_newspaper_no,TextInputType.number,'مخصصات'),
                     aTextBox("رقم السجل",_model.civil_record_no,TextInputType.number,'مخصصات'),
                     aTextBox("رقم البطاقة",_model.nat_id_no,TextInputType.number,'مخصصات'),
                     aTextBox("جهة الاصدار",_model.nat_id_issuer,TextInputType.text,'مخصصات'),
                     aDatePiker(context,'تاريخ اصدار البطاقة',_model.nat_id_date),
                   ])
               ),
               // بطاقة السكن
               Container(
                   width:double.infinity,
                   margin: const EdgeInsets.all(10),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                   child:Column(children: [
                     Text('معلومات بطاقة السكن'),
                     aTextBox("رقم البطاقة",_model.residence_card_no,TextInputType.number,'مخصصات'),
                     aDatePiker(context,'تاريخ اصدار البطاقة',_model.residence_card_date),
                   ])
               ),
             ],);
           }
         }),
        Container(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            padding: EdgeInsets.all(10),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.send,color: Colors.white70),
            Text("ارسال الشكوى",style: TextStyle(color: Colors.white70,fontSize: 18,fontWeight: FontWeight.bold),)
          ],),
          onPressed: (){},
        ),
        ),
        SetDoc(context,"وجه جنسية او هوية المقاتل", "https://hfd.gov.iq/img/1.0d223e24.png", _model.soldierIdFront, pickCameraSoldierIdFront),





      ],),),
    ));
  }

  Container aDatePiker(BuildContext context, String _label , TextEditingController _controller) {
    return Container(
             child:TextButton(
                   onPressed: () {
                     DatePicker.showDatePicker(context,

                         showTitleActions: true,
                         minTime: DateTime(1930, 1, 1),
                         maxTime: DateTime(2021, 12, 31), onChanged: (date) {
                           _controller.text = date.toString().substring(0,10);
                         }, onConfirm: (date) {
                           _controller.text = date.toString().substring(0,10);
                         }, currentTime: DateTime.now(), locale: LocaleType.ar);
                   },
                   child: Container(

                     padding: EdgeInsets.all(3),
                     child: TextFormField(
                       enabled: false,
                       controller: _controller,
                       decoration: InputDecoration(

                         label: Text(_label),
                         border: OutlineInputBorder(
                             borderSide: BorderSide(width: 1,color: Colors.black54)
                         ),

                       ),
                     ),)
               )
           );
  }

  Consumer<ComplaintsModel> aTextBox(String _label, TextEditingController _controller,TextInputType _keyboardType, String cond) {
    return Consumer<ComplaintsModel>(builder: (context, model, child) {
        return model.complaint_type==cond || cond ==''?
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: _keyboardType,
                controller: _controller,
              decoration: InputDecoration(
                label: Text(_label),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1)
                )
              ),
            ),
            )
            : SizedBox();
      });
  }
  Consumer smartSelect(String _title , String _value , List<S2Choice<String>> _options,String _cond) {
    return Consumer<ComplaintsModel>(builder: (context, model, child){

      return Container(
        child: Column(children: [
          _model.complaint_type=='مخصصات' || _cond==''?Container(
              width:double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
              child:SmartSelect<String>.single(
                  placeholder: "اختر",
                  title: _title,
                  value: _value,
                  choiceItems:_options,
                  onChange: (state) {
                    if(_title == 'نوع الشكوى')
                    {
                      model.changeCompaintType(state.value);
                    }
                    if(_title == 'محل الولادة')
                    {
                      model.changePlaceBirthday(state.value);
                    }
                    if(_title == 'الحالة الزوجية')
                    {
                      model.changeMaritalState(state.value);
                    }
                    if(_title == 'التعليم')
                    {
                      model.changeLearn(state.value);
                    }

                    if(_title == 'المحافظة الحالية')
                    {
                      model.changeCity(state.value);
                    }
                    if(_title == 'الديانة')
                    {
                      model.changeReligion(state.value);
                    }

                    if(_title == 'نوع الهوية')
                    {
                      model.changeIdType(state.value);
                    }




                  }
              )

          ):SizedBox()
        ],),
      );
    });
  }
  Future pickCameraSoldierIdFront() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    // setState(() {
    //   soldier_id_front = File(myfile!.path);
    //   print(soldier_id_front);
    // });
    _model.changeSoldierIdFront(File(myfile!.path)) ;
   // print(_model.soldierIdFront);
  }
  Column SetDoc(BuildContext context ,String _title, String _url,File doc,Future pickCamera()) {
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
            Expanded(child:
               Container(
                height: 80,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width /3.2,
                child:  Consumer<ComplaintsModel>(builder: (context, value, child){return Image.file(value.soldierIdFront);}),
              )

            ),
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
                    //pickGallery();
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
}






