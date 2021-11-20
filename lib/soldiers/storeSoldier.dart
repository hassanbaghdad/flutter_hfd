import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StoreSoldier extends ChangeNotifier{
  String qi = "";
  String salary = "";
  changeSalary(str)
  {
    salary = str;
    notifyListeners();
  }


  changeQi(str)
  {
    qi = str;
    notifyListeners();
  }


}