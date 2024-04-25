import 'package:bank_sha/models/sign-in_model.dart';
import 'package:bank_sha/models/sign-up_model.dart';
import 'package:bank_sha/models/user-edit_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/services/user_service.dart';
import 'package:bank_sha/services/wallet_service.dart';
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

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());

          final SignInModel data = await AuthService().getCredential();
          final UserModel user = await AuthService().signIn(data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                  name: event.data.name,
                  username: event.data.username,
                  email: event.data.email,
                  password: event.data.password,
                );

            emit(AuthLoading());

            await UserService().updateUser(event.data);

            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updatePin = (state as AuthSuccess).user.copyWith(
                  pin: event.newPin,
                );

            emit(AuthLoading());

            await WalletService().updatePin(event.oldPin, event.newPin);

            emit(AuthSuccess(updatePin));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthSignOut) {
        try {
          emit(AuthLoading());

          await AuthService().signOut();

          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
