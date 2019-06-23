import 'package:carros/domain/carro.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  final Carro carro;

  MapaPage(this.carro);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  GoogleMapController mapController;

  Carro get carro => widget.carro;

  @override
  Widget build(BuildContext context) {
    print(carro);
    print(carro.latlng);

    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: latlng(),
            zoom: 12,
          ),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          zoomGesturesEnabled: true,
          markers: Set.of(_getMarkers()),
        ),
      ),
    );
  }

  // Retorna os marcores da tela.
  List<Marker> _getMarkers() {
    return [
      Marker(
        markerId: MarkerId("1"),
        position: latlng(),
        infoWindow:
        InfoWindow(title: carro.nome, snippet: "Fábrica da Ferrari"),
        onTap: () {
          print("> ${carro.nome}");
        },
      )
    ];
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  latlng() {
    print(carro.latlng);
    return carro.latlng;
  }
}