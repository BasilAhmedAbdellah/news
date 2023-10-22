import 'package:flutter/material.dart';
import 'package:news/ui/homeScreen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      },
      initialRoute: HomeScreen.routeName,

    );
  }
}

