import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo_app/models/user_model.dart';

class AuthService {
  String baseUrl = 'http://192.168.1.2:8000/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal register');
    }
  }
}
