part of 'tip_bloc.dart';

sealed class TipEvent extends Equatable {
  const TipEvent();

  @override
  List<Object> get props => [];
}

class GetTip extends TipEvent {}
