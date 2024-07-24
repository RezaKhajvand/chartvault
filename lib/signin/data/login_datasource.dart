import 'dart:convert';

import 'package:chartvault/const/values.dart';
import 'package:chartvault/di.dart';
import 'package:dio/dio.dart';

Future<String> getLogin(
    {required String username, required String password}) async {
  var headers = {'Accept': 'application/json'};
  var data = FormData.fromMap({
    'username': username,
    'password': password,
    'client_secret': clientSecret,
    'client_id': clientId,
    'grant_type': grantType,
    'scope': ''
  });
  final Dio dio = locator.get();

  try {
    var response = await dio.request(
      '/oauth/token',
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
