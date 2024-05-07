import 'package:bank_sha/models/mobile-operator_model.dart';
import 'package:bank_sha/services/mobile-operator_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mobile_operator_event.dart';
part 'mobile_operator_state.dart';

class MobileOperatorBloc
    extends Bloc<MobileOperatorEvent, MobileOperatorState> {
  MobileOperatorBloc() : super(MobileOperatorInitial()) {
    on<MobileOperatorEvent>((event, emit) async {
      if (event is GetMobileOperator) {
        try {
          emit(MobileOperatorLoading());

          final mobileOperator =
              await MobileOperatorService().getMobileOperator();

          emit(MobileOperatorSuccesss(mobileOperator));
        } catch (e) {
          emit(MobileOperatorFailed(e.toString()));
        }
      }
    });
  }
}
