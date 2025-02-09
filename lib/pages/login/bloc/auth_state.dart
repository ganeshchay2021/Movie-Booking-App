part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errorMsg;

  AuthErrorState({required this.errorMsg});
}

final class AuthSuccessState extends AuthState {}
