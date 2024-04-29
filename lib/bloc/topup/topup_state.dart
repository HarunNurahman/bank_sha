part of 'topup_bloc.dart';

sealed class TopupState extends Equatable {
  const TopupState();

  @override
  List<Object> get props => [];
}

final class TopupInitial extends TopupState {}

final class TopupLoading extends TopupState {}

final class TopupSuccess extends TopupState {
  final String redirectUrl;
  const TopupSuccess(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}

final class TopupFailed extends TopupState {
  final String errorMessage;
  const TopupFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
