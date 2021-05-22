import 'package:flutter_app/modules/adress/infra/model/adress.dart';

abstract class IAdressRepository {
  Future<Adress> find(String cep);
}
