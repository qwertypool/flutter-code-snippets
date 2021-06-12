//This file will contain all the rest api integrations code for create/post/patch/delete
import 'dart:convert';
import 'package:dash_admin_dashboard/Dashboard/MenuItems/feature.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String baseurl = "http://dev-doas.codsgn.in/v1/";
  Future<http.Response> post(String url, Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    url = formatter(url);
    print(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );
    print(response.body);
    return response;
  }
   Future<http.Response> post1(String url, var body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    url = formatter(url);
    print(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );
    print(response.body);
    return response;
  }
}
