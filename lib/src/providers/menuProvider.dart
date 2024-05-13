


import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {

  dynamic opciones;

  _MenuProvider();

  Future<dynamic> cargaDataMenu() async{
    final resp = await rootBundle.loadString('data/menu_data.json');
    opciones = json.decode(resp);
    return opciones;
  }

}

final dataMenu =  _MenuProvider();
