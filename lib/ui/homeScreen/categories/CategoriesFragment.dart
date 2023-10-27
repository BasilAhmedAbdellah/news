import 'package:flutter/material.dart';
import 'package:news/ui/homeScreen/categories/Category.dart';
import 'package:news/ui/homeScreen/categories/CategoryWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnCategoryClick = void Function(Category category );
class CategoriesFragment extends StatefulWidget {
  OnCategoryClick onCategoryClick;
   CategoriesFragment(this.onCategoryClick,{super.key});

  @override
  State<CategoriesFragment> createState() => _CategoriesFragmentState();
}

class _CategoriesFragmentState extends State<CategoriesFragment> {
  List<Category> categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.pick_your_category_of_interest,
          style: TextStyle(
            fontSize:22,
            fontWeight: FontWeight.bold
          ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 20
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: (){
                        widget.onCategoryClick(categories[index]);
                    },
                    child: CategoryItem(categories[index],index)) ,
            itemCount: categories.length,),
          )
        ],
      ),
    );
  }
}
