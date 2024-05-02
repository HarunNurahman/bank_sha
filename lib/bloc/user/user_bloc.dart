import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserByUsername) {
        try {
          emit(UserLoading());

          final user = await UserService().getUserByUsername(event.username);

          emit(UserSuccess(user));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is GetRecentUser) {
        try {
          emit(UserLoading());

          final recentUser = await UserService().getRecentUser();

          emit(UserSuccess(recentUser));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
