import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://behinnavanteb.com')));
  // locator.registerSingleton<AuthManager>(AuthManager());
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
