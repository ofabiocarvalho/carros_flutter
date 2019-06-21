import 'package:carros/domain/services/carro_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: _listView(),
      ),
    );
  }

  _listView() {
    final carros = CarroService.getCarros();

    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (ctx, idx) {
          final c = carros[idx];

          return Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto,
                      ),
                    ),
                    Text(
                      c.nome,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Descrição...",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    ButtonTheme.bar(
                      // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          FlatButton(
                            child: const Text('LISTEN'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _listViewLayout3() {
    final carros = CarroService.getCarros();

    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (ctx, idx) {
          final c = carros[idx];

          return Container(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Image.network(c.urlFoto),
                      Container(
                        color: Colors.black45,
                        child: Center(
                          child: Text(
                            c.nome,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _listViewLayout2() {
    final carros = CarroService.getCarros();

    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (ctx, idx) {
          final c = carros[idx];

          return Container(
            height: 250,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Image.network(
                      c.urlFoto,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          c.nome,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _listViewLayout1() {
    final carros = CarroService.getCarros();

    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (ctx, idx) {
          final c = carros[idx];

          return Container(
            height: 150,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: Image.network(
                      c.urlFoto,
                      width: 150,
                    ),
                    title: Text(
                      c.nome,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      "descrição",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
