part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserByUsername extends UserEvent {
  final String username;
  const GetUserByUsername(this.username);

  @override
  List<Object> get props => [username];
}

class GetRecentUser extends UserEvent {}
