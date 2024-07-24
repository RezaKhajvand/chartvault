import 'dart:convert';

import 'package:chartvault/const/values.dart';
import 'package:chartvault/di.dart';
import 'package:dio/dio.dart';

Future<String> getSignup(
    {required String name,
    required String email,
    required String password,
    required String confirmpassword,
    required String number}) async {
  var headers = {'Accept': 'application/json'};
  var data = FormData.fromMap({
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': confirmpassword,
    'phone_country': 'IR',
    'phone': number,
    'grant_type': grantType,
    'client_id': clientId,
    'client_secret': clientSecret,
  });

  final Dio dio = locator.get();
  try {
    var response = await dio.request(
      '/api/app/register',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return json.encode(response.data);
    } else {
      throw Exception(response.statusMessage ?? 'Unknown Error');
    }
  } catch (e) {
    rethrow;
  }
}
