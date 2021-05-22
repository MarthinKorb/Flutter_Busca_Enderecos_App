import 'package:flutter/material.dart';
import 'package:flutter_app/modules/adress/infra/model/adress.dart';
import 'package:flutter_app/modules/adress/ui/my_home_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAdressPage extends StatefulWidget {
  @override
  _SearchAdressPageState createState() => _SearchAdressPageState();
}

class _SearchAdressPageState extends State<SearchAdressPage> {
  MyHomeBloc _bloc = MyHomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscador de Endereços',
          style: GoogleFonts.robotoCondensed(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: GoogleFonts.amarante(fontSize: 16),
              maxLength: 8,
              onChanged: (cep) {
                _bloc.input.add(cep);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Digite o cep',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
          StreamBuilder<Adress>(
            stream: _bloc.output,
            initialData: Adress(),
            builder: (context, snapshot) {
              final adress = snapshot.data;

              return Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContainer(
                        'Logradouro: ${adress?.logradouro ?? '--'}'),
                    _buildContainer(
                        'Complemento: ${adress?.complemento ?? '--'}'),
                    _buildContainer('IBGE: ${adress?.ibge ?? '--'}'),
                    _buildContainer('Estado: ${adress?.uf ?? '--'}'),
                    _buildContainer('DDD: ${adress?.ddd ?? '--'}'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: GoogleFonts.amarante(fontSize: 18),
      ),
    );
  }
}
