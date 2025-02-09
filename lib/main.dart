import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_booking_app/data/repository/auth_repository.dart';
import 'package:movie_booking_app/firebase_options.dart';
import 'package:movie_booking_app/pages/login/login_screen.dart';
import 'package:movie_booking_app/pages/login/widget/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // print('Firebase initialized: ${Firebase.apps.isNotEmpty}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FilmyFun',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const Login(),
      ),
    );
  }
}
