import 'dart:convert';
import 'dart:io';

import 'package:carros/domain/response.dart';
import 'package:carros/domain/user.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class LoginService {
  static Future<Response> login(String login, String senha) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return Response(false, "Internet indisponível.");
    }

    try {
//    var url = 'https://hml.fusionhealthcare.com.br/oauth/oauth/token';
//    var response = await http.post(url, headers: { 'Authorization': 'Basic ZnVzaW9uOmZ1c2lvbg==', 'Content-Type': 'application/x-www-form-urlencoded' }, body: {'client': 'fusion', 'username': login, 'password': senha, 'grant_type': 'password'});

      var url = 'http://livrowebservices.com.br/rest/login';
      var response =
          await http.post(url, body: {'login': login, 'senha': senha});

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final r = Response.fromJson(json.decode(response.body));

      if(r.isOk()){
        final user = User(
          "Fabio",
          login,
          "fabio@carvalho.com"
        );
        user.save();
      }

      return r;
    } catch (error) {
      return Response(false, handlerError(error));
    }
  }

  static String handlerError(error) {
    return error is SocketException
        ? "Internet indisponível. Por favor, verifique a sua conexão."
        : "Erro no login";
  }
}
