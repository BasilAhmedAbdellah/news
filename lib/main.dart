import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news/SplashScreen.dart';
import 'package:news/provider/SettingsProvider.dart';
import 'package:news/ui/homeScreen/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (buildContext) => SettingsProvider(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Color(0xFF39A552),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight:Radius.circular(24)
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF39A552),
        primary: const Color(0xFF39A552),
        ),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName:(buildContext)=>HomeScreen(),
        SplashScreen.routeName:(buildContext)=>SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar')
      ],
      locale: Locale(settingsProvider.currentLocale),
    );
  }
}

