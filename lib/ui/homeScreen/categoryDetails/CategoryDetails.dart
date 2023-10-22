import 'package:flutter/material.dart';
import 'package:news/model/Source.dart';
import 'package:news/ui/homeScreen/categories/Category.dart';
import 'package:news/ui/homeScreen/categoryDetails/SourcesTabsWidget.dart';

class CategoryDetails extends StatelessWidget {
  Category category;
   CategoryDetails(this.category,{super.key});
   List<Source> sourcesList=[
     Source('cnn', 'CNN'),
     Source('bbc', 'BBC'),
     Source('bein', 'BEIN'),
   ];
  @override
  Widget build(BuildContext context) {
    return SourcesTabsWidget(sourcesList);
  }
}
