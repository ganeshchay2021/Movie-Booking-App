import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_booking_app/data/repository/auth_repository.dart';
import 'package:movie_booking_app/firebase_options.dart';
import 'package:movie_booking_app/pages/login/widget/login.dart';

void main() async {
  // Ensures Flutter is initialized before using platform channels (e.g., Firebase).
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Firebase with platform-specific configuration.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Runs the app after initialization.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provides AuthRepository to the app using RepositoryProvider.
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Disables debug banner.
        title: 'FilmyFun', // App title.
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black, // Sets background color to black.
        ),
        home: const Login(), // Sets Login screen as the initial screen.
      ),
    );
  }
}
