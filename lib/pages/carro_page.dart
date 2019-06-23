import 'package:carros/domain/carro.dart';
import 'package:carros/domain/db/carro_db.dart';
import 'package:carros/domain/services/carro_service.dart';
import 'package:carros/pages/carro_form_page.dart';
import 'package:carros/pages/mapa_page.dart';
import 'package:carros/pages/video_page.dart';
import 'package:carros/utils/alerts.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarroPage extends StatefulWidget {
  final Carro carro;

  const CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  get carro => widget.carro;
  bool _isFavorito = false;

  @override
  void initState() {
    super.initState();

    CarroDB.getInstance().exists(carro).then((b) {
      if(b) {
        setState(() {
          _isFavorito = b;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () {
              _ClickMap(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              _onClickVideo(context);
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              _onClickPopupMenu(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
    Image.network(carro.urlFoto ?? "http://3.bp.blogspot.com/-rFZxeswg9zM/UZ6qPQiZOZI/AAAAAAAAK2A/Szg_xcZ_0cI/s1600/QT.jpg"),
      _carro(),
      _descricao(),
      ],
    );
  }

  _carro() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                carro.nome,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                carro.tipo,
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            _onClickFavoritar(context, carro);
          },
          child: Icon(
            Icons.favorite,
            color: _isFavorito ? Colors.red : Colors.grey,
            size: 36,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.share,
            size: 36,
          ),
        ),
      ],
    );
  }

  _descricao() {
    Future future = CarroService.getLoremIpsim();

    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(carro.desc,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          SizedBox(height: 10,),
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              return Center(
                child: snapshot.hasData ?
                Text(snapshot.data) :
                CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  Future _onClickFavoritar(context, carro) async {
    final db = CarroDB.getInstance();

    final exists = await db.exists(carro);

    if (exists) {
      await db.deleteCarro(carro.id);
    } else {
      await db.saveCarro(carro);
    };

    setState(() {
      _isFavorito = !exists;
    });
  }

  void _onClickPopupMenu(String value) {
    print("_onClickPopupMenu > $value");

    if ("Editar" == value) {
      push(context, CarroFormPage(carro: carro));
    } else if ("Deletar" == value) {
      deletar();
    }
  }

  void deletar() async {

    final response = await CarroService.deletar(carro.id);
    if(response.isOk()){
      pop(context);
    }else{
      alert(context, "Erro", response.msg);
    }

  }

  void _onClickVideo(context) {
    if(carro.urlVideo != null && carro.urlVideo.isNotEmpty) {
      //launch(carro.urlVideo);

      push(context, VideoPage(carro));
    } else {
      alert(context, "Erro", "Este carro não possui nenhum vídeo");
    }
  }

  void _ClickMap(BuildContext context) {
    push(context, MapaPage(carro));
  }
}
