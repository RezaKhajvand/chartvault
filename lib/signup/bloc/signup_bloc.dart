import 'package:bloc/bloc.dart';
import 'package:chartvault/signup/data/signup_datasource.dart';
import 'package:chartvault/signup/model/signup_model.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is GetSignupEvent) {
        emit(SignupLoading());
        try {
          final Signup response = signupFromJson(await getSignup(
            name: event.name,
            email: event.email,
            password: event.password,
            confirmpassword: event.confirmpassword,
            number: event.number,
          ));
          emit(SignupSuccess(successmsg: response.message));
        } catch (e) {
          emit(SignupError(errormsg: e.toString()));
        }
      }
    });
  }
}
