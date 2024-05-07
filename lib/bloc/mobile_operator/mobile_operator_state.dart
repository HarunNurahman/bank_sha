part of 'mobile_operator_bloc.dart';

sealed class MobileOperatorState extends Equatable {
  const MobileOperatorState();

  @override
  List<Object> get props => [];
}

final class MobileOperatorInitial extends MobileOperatorState {}

final class MobileOperatorLoading extends MobileOperatorState {}

final class MobileOperatorSuccesss extends MobileOperatorState {
  final List<MobileOperatorModel> mobileOperators;
  const MobileOperatorSuccesss(this.mobileOperators);

  @override
  List<Object> get props => [mobileOperators];
}

final class MobileOperatorFailed extends MobileOperatorState {
  final String errorMessage;
  const MobileOperatorFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
