part of 'transfer_bloc.dart';

sealed class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class PostTransfer extends TransferEvent {
  final TransferModel data;
  const PostTransfer(this.data);

  @override
  List<Object> get props => [data];
}
