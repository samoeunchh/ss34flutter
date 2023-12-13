import 'dart:convert';

import 'package:ss34flutter/models/category_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static String url = "http://127.0.0.1:5243/api/category";
  static Future<List<CategoryModel>> fetchCategory() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return List<CategoryModel>.from(
          json.decode(response.body).map((p) => CategoryModel.fromJson(p)));
    } else {
      throw Exception();
    }
  }

  static Future<bool> postCategory(CategoryModel category) async {
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(category));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
