import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddtoCartSheetProvider with ChangeNotifier{
  Color selectedcolorbackground=Colors.blueGrey;
  Color unselectedcolorbackground=Colors.white;
  Color selectettextcolor=Colors.white;
  Color unselectettextcolor=Colors.blueGrey;
  bool firstbutton=false;
  bool secondbutton=false;
  bool firstSizeButton=false;
  bool secondtSizeButton=false;
  bool thirdSizeButton=false;

void onlickfirstbutton(){

  if(firstbutton==true){
    firstbutton=false;
    notifyListeners();
  }
  else{
    firstbutton=true;
    secondbutton=false;
    notifyListeners();
  }

}
  void onlicksecondbutton(){

    if(secondbutton==true){
      secondbutton=false;
      notifyListeners();
    }
    else{
      secondbutton=true;
      firstbutton=false;
      notifyListeners();
    }

  }
  void onclickfirstSizeButton(){
  if(firstSizeButton==true){
    firstSizeButton==false;
    notifyListeners();
  }
  else{
    firstSizeButton=true;
    secondtSizeButton=false;
    thirdSizeButton=false;
    notifyListeners();
  }
  }
  void onclicksecondSizeButton(){
    if(secondtSizeButton==true){
      secondtSizeButton==false;
      notifyListeners();
    }
    else{
      secondtSizeButton=true;
      firstSizeButton=false;
      thirdSizeButton=false;
      notifyListeners();
    }
  }
  void onclickthirdSizeButton(){
    if(thirdSizeButton==true){
      thirdSizeButton==false;
      notifyListeners();
    }
    else{
      thirdSizeButton=true;
      firstSizeButton=false;
      secondtSizeButton=false;
      notifyListeners();
    }
  }


}