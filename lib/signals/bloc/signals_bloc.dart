import 'package:bloc/bloc.dart';
import 'package:chartvault/signals/data/signals_datasource.dart';
import 'package:chartvault/signals/models/signal_model.dart';
import 'package:meta/meta.dart';

part 'signals_event.dart';
part 'signals_state.dart';

class SignalsBloc extends Bloc<SignalsEvent, SignalsState> {
  SignalsBloc() : super(SignalsInitial()) {
    on<SignalsFetchEvent>((event, emit) async {
      emit(SignalsLoading());
      try {
        var signals = signalModelFromJson(await fetchSignals());
        print(event.statusCode);
        if (event.statusCode != null) {
          signals.data.removeWhere((element) {
            print('${event.statusCode} : ${element.statusCode}');
            return event.statusCode != element.statusCode;
          });
        }
        emit(SignalsLoaded(signals: signals));
      } catch (e) {
        emit(SignalsError(message: e.toString()));
      }
    });
  }
}
