part of 'data_plan_bloc.dart';

sealed class DataPlanEvent extends Equatable {
  const DataPlanEvent();

  @override
  List<Object> get props => [];
}

class PostDataPlan extends DataPlanEvent {
  final MobileDataPackageModel data;
  const PostDataPlan(this.data);

  @override
  List<Object> get props => [data];
}
