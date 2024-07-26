import 'package:bloc/bloc.dart';
import 'package:chartvault/profile/data/profiles_datasource.dart';
import 'package:chartvault/profile/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileFetchEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        var profile = profileFromJson(await fetchProfile());
        emit(ProfileLoaded(profile: profile));
      } catch (e) {
        emit(ProfileError(errormsg: e.toString()));
      }
    });
  }
}
