import 'package:dio/dio.dart';
import 'package:flutter_app/modules/adress/infra/model/adress.dart';
import 'package:flutter_app/modules/adress/repositories/i_adress_repository.dart';

class AdressRepository extends IAdressRepository {
  String url(String cep) => 'https://viacep.com.br/ws/$cep/json/';
  @override
  Future<Adress> find(String cep) async {
    Response response = await Dio().get(url(cep));
    return Adress.fromJson(response.data);
  }
}
