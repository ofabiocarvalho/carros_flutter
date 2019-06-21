import 'package:carros/domain/carro.dart';

class CarroService {
  static List<Carro> getCarros(){
    final carros = List.generate(50, (idx){
      return Carro("Ferrari $idx",
          //"https://abrilquatrorodas.files.wordpress.com/2019/02/dc5aeab5-ferrari-f8-tributo-1.jpg?quality=70&strip=info&resize=680,453"
          "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png"
      );
    });

    return carros;
  }
}