import 'package:carros/domain/carro.dart';
import 'package:carros/domain/services/favoritos_service.dart';
import 'package:carros/widgets/carros_listView.dart';
import 'package:carros/widgets/error_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();

}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(12),
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("carros").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorText("Nenhum carro disponível");
            } else if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final service = FavoritosService();
              final List<Carro> carros =  service.toList(snapshot);

              return CarrosListView(carros);
            }
          }),
    );
  }
}
