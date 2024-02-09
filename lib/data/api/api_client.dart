import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class ApiClient {
  static const String BASE_URL = "https://newsapi.org/v2/";
  static const String API_KEY = "388ef206dbe848c0999b94c394c07468";


  Future<http.Response> get(String url, {String token = ""}) async {
    if (kDebugMode) {
      print('====> API Call: $url\nToken: $token');
    }
    final response = await http.get(Uri.parse(BASE_URL + url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": token == "" ? "" : "Bearer $token",
      "Access-Control_Allow_Origin": "*"
    });
    if (kDebugMode) {
      print(
          '====> API Response: [${response.statusCode}] $url\n${response.body}');
    }
    return response;
  }
}
