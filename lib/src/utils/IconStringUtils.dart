import 'package:flutter/material.dart';


final _icon = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large'   : Icons.donut_large,
  'input'         : Icons.input,
  'list'          : Icons.list,
  'tune'          : Icons.tune,
  'cam'          : Icons.camera_enhance,
  'dashboard' : Icons.dashboard
};

Icon getIcon(String nombreIcono) {
  return Icon(_icon[nombreIcono]);
}