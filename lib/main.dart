import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/login/login_screen.dart';

import 'package:movie_booking_app/pages/movie%20details/movie_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FilmyFun',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LoginScreen(),
    );
  }
}
