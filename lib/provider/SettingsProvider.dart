import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{

  String currentLocale = 'en';

  void ChangeLocal(String NewLocal){
    if(NewLocal  == currentLocale)return;
    currentLocale = NewLocal;
    notifyListeners();
  }

}