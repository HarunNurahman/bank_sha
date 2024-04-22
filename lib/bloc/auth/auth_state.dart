part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthCheckEmailSuccess extends AuthState {}

final class AuthFailed extends AuthState {
  final String errorMessage;
  const AuthFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class AuthSuccess extends AuthState {
  final UserModel user;
  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}
