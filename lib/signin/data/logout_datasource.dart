import 'dart:convert';
import 'package:chartvault/di.dart';
import 'package:chartvault/utils/authmanager.dart';
import 'package:dio/dio.dart';

Future<String> getLogout() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${AuthManager.readAccessToken()}'
  };
  print(headers);
  final Dio dio = locator.get();

  try {
    var response = await dio.request(
      '/api/app/logout',
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
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
