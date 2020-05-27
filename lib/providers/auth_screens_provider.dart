import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AuthScreenProvider with ChangeNotifier{
  var _loginmode=true;

 bool loginmode(){
  if(_loginmode){
    return true;
  }
  else{
    return false;
  }
 }
 void switchmode(){
   _loginmode=!_loginmode;
   notifyListeners();
 }


}