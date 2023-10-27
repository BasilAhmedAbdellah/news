import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
typedef OnMenuItemClick = void Function(MenuItem ClickedItemPos);
class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;
   HomeDrawer(this.onMenuItemClick,{super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 36),
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: Text(AppLocalizations.of(context)!.news_app

              ,style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            InkWell(
              onTap: (){
               onMenuItemClick(MenuItem.categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list,size: 32,),
                  Text(AppLocalizations.of(context)!.categories,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
               onMenuItemClick(MenuItem.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings,size: 32,),
                  Text(AppLocalizations.of(context)!.settings,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
enum MenuItem{
  categories,
  settings
}
