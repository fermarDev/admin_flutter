

import 'package:flutter/material.dart';

class PageUtils extends StatelessWidget {
  late Widget dataWid;
  String title = '';
  PageUtils({super.key,  dataWidget, titlePage}){
    dataWid= dataWidget;
    title = titlePage;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: dataWid,
      ),
    );
  }
}
