part of 'tip_bloc.dart';

sealed class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

final class TipInitial extends TipState {}

final class TipLoading extends TipState {}

final class TipSuccess extends TipState {
  final List<TipModel> tips;
  const TipSuccess(this.tips);

  @override
  List<Object> get props => [tips];
}

final class TipFailed extends TipState {
  final String errorMessage;
  const TipFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
