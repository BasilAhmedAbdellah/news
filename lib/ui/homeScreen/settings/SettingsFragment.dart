import 'package:flutter/material.dart';
import 'package:news/provider/SettingsProvider.dart';
import 'package:news/ui/homeScreen/settings/LanguageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class SettingsFragment extends StatefulWidget {
  const SettingsFragment({super.key});

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {

  @override
  Widget build(BuildContext context) {
    var provider  = Provider.of<SettingsProvider>(context);
    return Scaffold(

     body: Padding(
       padding: const EdgeInsets.all(28.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Text(AppLocalizations.of(context)!.language,style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w700
           ),),
           SizedBox(height: 14,),
           InkWell(
               onTap: () {
                 showLanguageBottomSheet();
               },
               child: Container(
                 width: double.infinity,
                 padding: EdgeInsets.all(12),

                 decoration: BoxDecoration(
                   color: Theme.of(context).colorScheme.background,
                   border:
                   Border.all(color:Colors.green, width: 1 ,),
                 ),
                 child: Text(
                     provider.currentLocale == 'en' ? "English" : "العربيه",
                     style: Theme.of(context).textTheme.titleMedium),
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


