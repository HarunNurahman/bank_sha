part of 'mobile_operator_bloc.dart';

sealed class MobileOperatorEvent extends Equatable {
  const MobileOperatorEvent();

  @override
  List<Object> get props => [];
}

class GetMobileOperator extends MobileOperatorEvent {}
