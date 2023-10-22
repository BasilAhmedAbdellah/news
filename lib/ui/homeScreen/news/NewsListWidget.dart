import 'package:flutter/material.dart';
import 'package:news/model/News.dart';
import 'package:news/model/Source.dart';
import 'package:news/ui/homeScreen/news/NewsWidget.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
 NewsListWidget(this.source,{super.key});
 List<News> newsList=[
   News(10, '''Real madrid beats liverpool in the champions league knock out stage''', 'assets/images/news_image.png', "19/2/2023", 'BBC News'),
   News(10, '''Real madrid beats liverpool in the champions league knock out stage''', 'assets/images/news_image.png', "19/2/2023", 'BBC News'),
   News(10, '''Real madrid beats liverpool in the champions league knock out stage''', 'assets/images/news_image.png', "19/2/2023", 'BBC News'),
   News(10, '''Real madrid beats liverpool in the champions league knock out stage''', 'assets/images/news_image.png', "19/2/2023", 'BBC News'),
   News(10, '''Real madrid beats liverpool in the champions league knock out stage''', 'assets/images/news_image.png', "19/2/2023", 'BBC News'),
   News(10, '''Real madrid beats liverpool in the champions league knock out stage''', 'assets/images/news_image.png', "19/2/2023", 'BBC News'),
 ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
     return NewsWidget(newsList[index]);
    },itemCount:newsList.length ,);
  }
}
