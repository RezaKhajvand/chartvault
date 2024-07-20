import 'package:bloc/bloc.dart';
import 'package:chartvault/login/data/login_datasource.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<GetLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await getLogin(username: event.username, password: event.password);
        emit(LoginLoaded());
      } catch (e) {
        emit(LoginError(errormsg: e.toString()));
      }
    });
  }
}
