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
