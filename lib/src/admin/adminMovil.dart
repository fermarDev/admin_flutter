import 'package:admin_app/src/providers/menuProvider.dart';
import 'package:admin_app/src/utils/IconStringUtils.dart';
import 'package:flutter/material.dart';

class AdminMovil extends StatefulWidget {
  const AdminMovil({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminMovil> {
  bool isPanelVisible = true;
  String selectedMenu = '';
  String titleMenu = '';
  String keyMenu = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataMenu.cargaDataMenu(),
      builder: (context, snapshot) {
        return _menuDinamicMovil(context, snapshot.data);
      },
    );
  }

  Widget _menuDinamicMovil(BuildContext context, Map data) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleMenu),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: _menuDinamic(data, context),
        ),
      ),
      body: Center(
        child: _contextMenuCreateDinamic(data['menus']),
      ),
    );
  }

  List<Widget> _menuDinamic(data, context) {
    List<Widget> listmenus = [];

    listmenus.add(
      DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromRGBO(
                data['menuColor']['r'],
                data['menuColor']['g'],
                data['menuColor']['b'],
                data['menuColor']['opacity']),
          ),
          padding: EdgeInsets.all(50),
          child: SizedBox(
              child:
                  Image.network(fit: BoxFit.contain, data['logo'].toString()))),
    );
    listmenus.add(ListTile(
      leading: const Icon(Icons.account_circle),
      title: const Text('Perfil'),
      onTap: () {
        Navigator.pushNamed(context, '/user');
      },
    ));
    List<dynamic> listMenu = data['menus'];
    listMenu.forEach((element) {
      listmenus.add((ListTile(
        leading: getIcon(element['icon']),
        title: Text(element['title']),
        onTap: () {
          setState(() {
            keyMenu = element['key'];
            titleMenu = element['title'];
            Navigator.pop(context);
          });
        },
      )));
    });
    return listmenus;
  }

  Widget _contextMenuCreateDinamic(List<dynamic> widgetsMenu) {
    Widget widgetPaint;
    widgetPaint = const Text("Menu principal");
    widgetsMenu.forEach((data) {
      if (keyMenu == data['key']) {
        widgetPaint = Text('Menú de ' + data['title']);
      }
    });
    return widgetPaint;
  }
}
