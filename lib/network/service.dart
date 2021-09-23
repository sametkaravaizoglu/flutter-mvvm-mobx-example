import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm_mobx_example/consts/app_constants.dart';

class Service {
  static Future<dynamic> get(
    String path,
  ) async {
    final response = await http.get(
      Uri.parse("${ApplicationConstants.BASE_URL}$path"),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.body;
      default:
        throw response.body;
    }
  }
}
