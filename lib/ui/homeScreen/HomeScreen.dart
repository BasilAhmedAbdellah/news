import 'package:flutter/material.dart';
import 'package:news/ui/homeScreen/HomeDrawer.dart';
import 'package:news/ui/homeScreen/categories/CategoriesFragment.dart';
import 'package:news/ui/homeScreen/categories/Category.dart';
import 'package:news/ui/homeScreen/categoryDetails/CategoryDetails.dart';
import 'package:news/ui/homeScreen/settings/SettingsFragment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget=CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"),
        fit: BoxFit.cover,
        ),

      ),
      child: Scaffold(
        drawer: HomeDrawer(onMenuItemClick),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.news_app),
        ),
        body: selectedWidget,
      ),
    );
  }

 late Widget selectedWidget ;

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
      switch(item){
        case MenuItem.categories:{
          selectedWidget=CategoriesFragment(onCategoryItemClick);
        }
        case MenuItem.settings : {
            selectedWidget=SettingsFragment();
        }
      }
      setState((){});
  }
  void onCategoryItemClick(Category category){
    selectedWidget=CategoryDetails(category);
    setState(() {});
  }
}
