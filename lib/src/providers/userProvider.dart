import 'dart:convert';
import 'package:flutter/services.dart';

class _UserProvider {

  List<dynamic> opciones = [];

  _UserProvider();

  Future<List<dynamic>> cargaDataUser() async{
    final resp = await rootBundle.loadString('data/user_data.json');
    opciones = json.decode(resp);
    return opciones;
  }

}

final dataUser =  _UserProvider();