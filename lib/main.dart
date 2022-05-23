import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/screens/homeScreen.dart';
import 'const/colors.dart';

void main() {
  runApp(MovieApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Movies",
      theme: new ThemeData(scaffoldBackgroundColor: AppColors.primaryColor),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


