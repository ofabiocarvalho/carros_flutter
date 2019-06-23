import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String mensagem;

  const ErrorText(this.mensagem);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        mensagem,
        style: TextStyle(fontSize: 26, color: Colors.grey),
      ),
    );
  }
}
