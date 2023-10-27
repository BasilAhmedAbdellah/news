import 'package:flutter/material.dart';
import 'package:news/provider/SettingsProvider.dart';
import 'package:provider/provider.dart';
class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.ChangeLocal('en');
                Navigator.pop(context);
              },
              child: provider.currentLocale == 'en'
                  ? getSelectedItem('English')
                  : getUnselectedItem('English')),
          SizedBox(height: 12,),
          InkWell(
              onTap: () {
                provider.ChangeLocal('ar');
                Navigator.pop(context);
              },
              child: provider.currentLocale == 'ar'
                  ? getSelectedItem('العربيه')
                  : getUnselectedItem('العربيه')),
        ],
      ),
    );
  }
  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ),
        Icon(
          Icons.check,

        ),
      ],
    );
  }

  Widget getUnselectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
