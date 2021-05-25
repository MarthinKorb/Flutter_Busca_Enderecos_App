import 'dart:async';

import 'package:flutter_app/modules/adress/infra/model/adress.dart';
import 'package:flutter_app/modules/adress/infra/repositories/adress_repository.dart';
import 'package:flutter_app/modules/adress/repositories/i_adress_repository.dart';

class MyHomeBloc {
  IAdressRepository adressRepository;
  MyHomeBloc({IAdressRepository adressRepository}) {
    this.adressRepository = AdressRepository();
  }

  // ignore: close_sinks
  final StreamController<String> _streamController =
      StreamController.broadcast();

  Sink<String> get input => _streamController.sink;

  Stream<Adress> get output => _streamController.stream
      .where((cep) => cep.length > 7)
      .asyncMap((cep) => _searchAdress(cep));

  Future<Adress> _searchAdress(String cep) async {
    return await adressRepository.find(cep);
  }
}
