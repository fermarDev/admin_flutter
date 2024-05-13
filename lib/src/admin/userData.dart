import 'dart:collection';

import 'package:admin_app/src/providers/userProvider.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Column(
          children: _crearInfoUser(snapshot.data, context, snapshot.error),
        );
      },
      future: dataUser.cargaDataUser(),
    );
  }

  List<Widget> _crearInfoUser(
      List<dynamic>? data, BuildContext context, error) {
    final List<Widget> opciones = [];
    if (data != null) {
      data.sort((a, b) => a['order'].compareTo(b['order']));
      data.forEach((element) {
        if (element['type'] == 'image') {
          opciones.add(CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(element['src']),
          ));
        } else if (element['type'] == 'Label') {
          opciones.add(Text(
              style: const TextStyle(fontSize: 20),
              element['titleLabel'].toString() + ':'));
          opciones.add(Text(
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              element['textLabel'].toString()));
        } else if (element['type'] == 'Divider') {
          opciones.add(Divider(height: 30));
        }
      });
    }

    return opciones;
  }
}
