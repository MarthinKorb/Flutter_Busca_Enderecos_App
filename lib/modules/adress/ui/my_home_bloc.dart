import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app/modules/adress/infra/model/adress.dart';

class MyHomeBloc {
  // ignore: close_sinks
  final StreamController<String> _streamController =
      StreamController.broadcast();

  Sink<String> get input => _streamController.sink;

  Stream<Adress> get output => _streamController.stream
      .where((cep) => cep.length > 7)
      .asyncMap((cep) => _serachAdress(cep));

  String url(String cep) => 'https://viacep.com.br/ws/$cep/json/';

  Future<Adress> _serachAdress(String cep) async {
    Response response = await Dio().get(url(cep));
    return Adress.fromJson(response.data);
  }
}
