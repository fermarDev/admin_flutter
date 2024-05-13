



import 'package:admin_app/src/admin/userData.dart';
import 'package:admin_app/src/utils/pageUtils.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/user': (BuildContext context) => PageUtils(dataWidget:UserData(), titlePage:'User Data')
  };
}