import 'package:bloc/bloc.dart';
import 'package:chartvault/workshop/data/workshop_datasource.dart';
import 'package:chartvault/workshop/models/workshop_model.dart';
import 'package:meta/meta.dart';

part 'workshop_event.dart';
part 'workshop_state.dart';

class WorkshopBloc extends Bloc<WorkshopEvent, WorkshopState> {
  WorkshopBloc() : super(WorkshopInitial()) {
    on<FetchWorkshopEvent>((event, emit) async {
      emit(WorkshopLoading());
      try {
        var workshop = workshopFromJson(await fetchWorkshop());
        emit(WorkshopLoaded(workshop: workshop));
      } catch (e) {
        emit(WorkshopError(errormsg: e.toString()));
      }
    });
  }
}
