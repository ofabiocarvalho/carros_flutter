import 'dart:convert';

import 'package:carros/domain/response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<Response> login(String login, String senha) async{

//    var url = 'https://hml.fusionhealthcare.com.br/oauth/oauth/token';
//    var response = await http.post(url, headers: { 'Authorization': 'Basic ZnVzaW9uOmZ1c2lvbg==', 'Content-Type': 'application/x-www-form-urlencoded' }, body: {'client': 'fusion', 'username': login, 'password': senha, 'grant_type': 'password'});

    var url = 'http://livrowebservices.com.br/rest/login';
    var response = await http.post(url, body: {'login': login, 'senha': senha});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final r = Response.fromJson(json.decode(response.body));

    return r;
  }
}