import 'package:admin_app/src/admin/adminDesk.dart';
import 'package:admin_app/src/admin/adminMovil.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 900) {
        return const AdminMovil(); // Layout para pantallas grandes
      } else {
        return AdminDesk(); // Layout para pantallas estrechas
      }
    });
  }
}
