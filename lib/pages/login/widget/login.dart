import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_booking_app/data/repository/auth_repository.dart';
import 'package:movie_booking_app/pages/login/bloc/auth_bloc.dart';
import 'package:movie_booking_app/pages/login/login_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: context.read<AuthRepository>()),
      child: const LoginScreen(),
    );
  }
}
