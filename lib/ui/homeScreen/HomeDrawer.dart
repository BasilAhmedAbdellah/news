import 'package:flutter/material.dart';

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
              child: Text("News App!"

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
                  Text('Categories',
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
                  Text('Settings',
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
