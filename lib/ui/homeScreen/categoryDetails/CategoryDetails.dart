import 'package:flutter/material.dart';
import 'package:news/ApiManager/apiManager.dart';
import 'package:news/ui/homeScreen/categories/Category.dart';
import 'package:news/ui/homeScreen/categoryDetails/SourcesTabsWidget.dart';

class CategoryDetails extends StatelessWidget {
  Category category;
   CategoryDetails(this.category,{super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManger.getSources(category.id)
        , builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      else if (snapshot.hasError || snapshot.data?.status == 'error'){
        return Center(
          child: Column(
            children: [
              Text( snapshot?.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: (){}, child: Text("Try Again"))
            ],
          ),
        );
      }
      var sourcesList = snapshot.data?.sources;
        return SourcesTabsWidget(sourcesList!);
        },);
  }
}
