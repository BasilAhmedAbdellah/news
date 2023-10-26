import 'package:flutter/material.dart';
import 'package:news/ui/homeScreen/settings/LanguageBottomSheet.dart';

class SettingsFragment extends StatefulWidget {
  const SettingsFragment({super.key});

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(18.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           InkWell(
             onTap: (){
               showLanguageBottomSheet();
             },
             child: Container(
               width: double.infinity,
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Theme.of(context).colorScheme.background,
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: Theme.of(context).dividerColor,
                     width: 1),

               ),
               child: Text("Language"),
             ),
           ),
         ],
       ),
     ),
    );

  }
  void  showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}


