import 'package:flutter/material.dart';
import 'package:news/ApiManager/apiManager.dart';
import 'package:news/model/sourcesResponse/Source.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? newsSourcesList;
  String? errorMessage;
  bool? showLoading = true;

  void getSources(String categoryId)async{
    showLoading = true;
    newsSourcesList=null;
    errorMessage=null;
    notifyListeners();
    try {
      var response = await ApiManger.getSources(categoryId);
      showLoading = null;
      if(response.status=='error'){
        errorMessage = response.message;
      }
      else{
        newsSourcesList=response.sources;
      }
    } catch (e) {
      showLoading=null;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}