import 'package:carros/domain/services/login_service.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/utils/alerts.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController(text: "facarvalho");
  final _tSenha = TextEditingController(text: "fusion");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zanquiefs"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _tLogin,
            validator: _validateLogin,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: "Digite o seu login",
                hintStyle: TextStyle(color: Colors.black45, fontSize: 18)),
          ),
          TextFormField(
            controller: _tSenha,
            validator: _validateSenha,
            obscureText: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                hintText: "Digite o seu login",
                hintStyle: TextStyle(color: Colors.black45, fontSize: 18)),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              color: Colors.blue,
              child: _progress
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
              onPressed: () {
                _onClickLogin(context);
              },
            ),
          ),
//          Container(
//              margin: EdgeInsets.only(top: 20),
//              child: Stack(
//                children: <Widget>[
//                  Container(
//                    child: Image.asset("assets/images/zangief.jpg",
//                        fit: BoxFit.contain),
//                  ),
//                  Container(
//                    height: 100,
//                    child: Image.asset(
//                      "assets/images/sao-paulo-antigo.png",
//                    ),
//                  ),
//                ],
//              ))
        ],
      ),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }

    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }

    if (text.length < 6) {
      return "Senha precisa ter 6 caracteres";
    }

    return null;
  }

  _onClickLogin(BuildContext context) async {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    if (!_formKey.currentState.validate()) {
      return;
    }

    setState(() {
      _progress = true;
    });

    print("Login: $login, senha: $senha");

    final response = await LoginService.login(login, senha);

    if (response.isOk()) {
      pushReplacement(context, HomePage());
    } else {
      alert(context, "Erro", response.msg);
    }

    setState(() {
      _progress = false;
    });
  }
}
