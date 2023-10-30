import 'package:flutter/material.dart';
import 'package:news/ApiManager/apiManager.dart';
import 'package:news/ui/homeScreen/HomeScreen.dart';
import 'package:news/ui/homeScreen/categories/Category.dart';
import 'package:news/ui/homeScreen/categoryDetails/CategoryDetailsViewModel.dart';
import 'package:news/ui/homeScreen/categoryDetails/SourcesTabsWidget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
   CategoryDetails(this.category,{super.key});
   var viewModel = CategoryDetailsViewModel();

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();
@override
  void initState() {
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.showLoading==true){
          return Center(child: CircularProgressIndicator());
        } else if(viewModel.errorMessage!=null){
          return Center(
            child: Column(
              children: [
                Text( viewModel.errorMessage ?? ""),
                ElevatedButton(onPressed: (){
                  viewModel.getSources(widget.category.id);
                }, child: Text("Try Again"))
              ],
            ),
          );}

          var sourcesList = viewModel.newsSourcesList;
          return SourcesTabsWidget(sourcesList!);
      },),
    );
  }
}

/* return FutureBuilder(future: ApiManger.getSources(category.id)
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
        child: Builder(builder: (context) {

          }
        */

