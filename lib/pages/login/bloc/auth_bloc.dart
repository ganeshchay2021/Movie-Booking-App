// auth_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:movie_booking_app/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<AuthLoginEvent>((event, emit) async {
      // Emit loading state
      emit(AuthLoadingState());

      // Call repository method to perform login
      final result = await authRepository.login(
          email: event.email, password: event.password);

      // Handle the result and emit appropriate state
      result.fold(
        (data) => emit(AuthSuccessState()),
        (error) => emit(AuthErrorState(errorMsg: error)),
      );
    },
        transformer:
            droppable() //cancel the new request untill previous event complete
        );

    on<AuthSignUpEvent>((event, emit) async {
      // Emit loading state
      emit(AuthLoadingState());

      // Call repository method to perform login
      final result = await authRepository.register(
          email: event.email, password: event.password, name: event.name);

      // Handle the result and emit appropriate state
      result.fold(
        (data) => emit(
          AuthSuccessState(),
        ),
        (error) => emit(AuthErrorState(errorMsg: error)),
      );
    },
        transformer:
            droppable() //cancel the new request untill previous event complete
        );
  }
}
