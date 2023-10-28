import 'package:flutter/material.dart';
import 'package:news/ApiManager/apiManager.dart';
import 'package:news/model/sourcesResponse/Source.dart';
import 'package:news/ui/homeScreen/news/NewsWidget.dart';

class NewsListWidget extends StatelessWidget {
  Source source;
 NewsListWidget(this.source,{super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManger.getNews(source.id)

        , builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data?.status == 'error'){
            return Center(
              child: Column (
                children: [
                  Text(snapshot.data?.message ??
                      snapshot.error.toString()),
                  ElevatedButton(onPressed: (){}, child: Text("Try Again"))
                ],
              ),
            );
          }
      var newsList= snapshot.data?.articles;
      return  ListView.builder(itemBuilder: (context, index) {
        return NewsWidget(newsList![index]);
      },itemCount:newsList?.length ?? 0 ,);
        },);




  }
}
