import 'package:flutter/material.dart';
import 'package:news_page/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Flutter App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : ( BuildContext context ) => HomePage(), 
      },
    );
  }
}