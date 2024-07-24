import 'package:bloc/bloc.dart';
import 'package:chartvault/signin/data/login_datasource.dart';
import 'package:chartvault/signin/model/auth_model.dart';
import 'package:chartvault/utils/authmanager.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<GetLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        var authData = authModelFromJson(
            await getLogin(username: event.username, password: event.password));
        await AuthManager.saveAccessToken(authData.accessToken);
        await AuthManager.saveRefreshToken(authData.refreshToken);
        await AuthManager.saveExpireIn(authData.expiresIn);
        await AuthManager.saveLoginTime(DateTime.now());

        emit(LoginLoaded());
      } catch (e) {
        emit(LoginError(errormsg: e.toString()));
      }
    });
  }
}
