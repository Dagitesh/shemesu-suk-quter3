import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shemsu_suk/model/Activity.dart';

class ApiServiceProvider {
  Future<Activity?> fetchActivity() async {
    final response = await http.get(
      Uri.parse('https://www.boredapi.com/api/activity'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print("/" * 20);
      print(response.body);
      return Activity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
