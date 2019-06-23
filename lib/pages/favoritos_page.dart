import 'package:carros/domain/carro.dart';
import 'package:carros/domain/db/carro_db.dart';
import 'package:carros/domain/services/carro_service.dart';
import 'package:carros/widgets/carros_listView.dart';
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
    Future<List<Carro>> future = CarroDB.getInstance().getCarros();

    return Container(
      padding: EdgeInsets.all(12),
      child: FutureBuilder<List<Carro>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Nenhum carro disponível",
                  style: TextStyle(fontSize: 26, color: Colors.grey),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CarrosListView(snapshot.data);
            }
          }),
    );
  }
}
