import 'package:flutter/material.dart';
import 'package:news/model/newsResponse/news.dart';


class NewsWidget extends StatelessWidget {
  News news;
   NewsWidget(this.news,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(news.urlToImage??"",
            height: 220,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(news.author??'',
          textAlign: TextAlign.start,
          ),
          Text(news.title??'',
            textAlign: TextAlign.start,),
          Text(news.publishedAt??'',
            textAlign: TextAlign.end)
        ],
      ),
    );
  }
}
