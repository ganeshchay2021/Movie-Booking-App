import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_booking_app/data/repository/auth_repository.dart';
import 'package:movie_booking_app/pages/signup/cubit/signup_cubit.dart';
import 'package:movie_booking_app/pages/signup/sign_up_screen.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(authRepository: context.read<AuthRepository>()),
      child: const SignUpScreen(),
    );
  }
}
