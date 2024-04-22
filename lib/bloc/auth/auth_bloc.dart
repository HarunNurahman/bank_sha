import 'package:bank_sha/models/sign-in_model.dart';
import 'package:bank_sha/models/sign-up_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmailEvent) {
        try {
          emit(AuthLoading());

          final response = await AuthService().checkEmail(event.email);
          if (response == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            const AuthFailed('Email Sudah Terpakai!');
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthSignUp) {
        try {
          emit(AuthLoading());

          final user = await AuthService().signUp(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthSignIn) {
        try {
          emit(AuthLoading());

          final user = await AuthService().signIn(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
