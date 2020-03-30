import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mexico_news/src/provider/NewsProvider.dart';
import 'package:mexico_news/src/screens/Home.dart';
import 'package:mexico_news/src/screens/NewsDetail.dart';
import 'package:mexico_news/src/widgets/ViewWeb.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.robotoCondensedTextTheme(textTheme).copyWith(
          body1: GoogleFonts.robotoCondensed(color: Colors.white)
        ),
        appBarTheme: AppBarTheme(
          color: Colors.black87,
          textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 20),),
          iconTheme: IconThemeData(color: Colors.white),
        )
      ),
      home: Home(),
      routes: {
        'newsDetail'  : (BuildContext context) => NewsDetail(),
        'viewWeb'     : (BuildContext context) => ViewWeb()
      },
    );
  }
}