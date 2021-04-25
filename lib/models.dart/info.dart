// class Info{
//   String title;
//   String description;

//   Info(){
//     title = "Default title";
//     description = "This is default description";
//   }
// }

import 'package:flutter/widgets.dart';

class Info with ChangeNotifier{
  String _title;
  String _description;

  Info(){
    _title="Default Title";
    _description = "This is default description"; 
  }

  String get title => _title;
  String get description => _description;

  chaneTitle(String value){
    _title=value;
    notifyListeners();
  }
  changedescription(String value){
    _description = value;
    notifyListeners();
  }
}