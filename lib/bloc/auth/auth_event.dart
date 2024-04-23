part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmailEvent extends AuthEvent {
  final String email;
  const AuthCheckEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}

class AuthSignUp extends AuthEvent {
  final SignUpModel data;
  const AuthSignUp(this.data);

  @override
  List<Object> get props => [data];
}

class AuthSignIn extends AuthEvent {
  final SignInModel data;
  const AuthSignIn(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}
