import 'package:flutter/material.dart';
import 'package:news/ApiManager/apiManager.dart';
import 'package:news/model/newsResponse/news.dart';

class NewsListViewModel extends ChangeNotifier{
  List<News>? newsList;
  bool? showLoading;
  String? errorMessage;

  void getNews(String sourceId)async{
    showLoading = true;
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManger.getNews(sourceId);
      showLoading = false;
      if(response.status == 'error'){
        errorMessage=response.message;
      }
      else {
        newsList = response.articles;
      }
    }catch(e){
      showLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}