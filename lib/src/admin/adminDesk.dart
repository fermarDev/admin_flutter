import 'package:admin_app/src/admin/userData.dart';
import 'package:admin_app/src/providers/menuProvider.dart';
import 'package:admin_app/src/utils/IconStringUtils.dart';
import 'package:flutter/material.dart';

class AdminDesk extends StatefulWidget {
  const AdminDesk({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminDesk> {
  bool isPanelVisible = true;
  String selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: dataMenu.cargaDataMenu(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        return _menuDinamic(context, snapshot.data);
      },
    );
  }

  Widget _menuDinamic(context, data) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(
                data['menuColor']['r'],
                data['menuColor']['g'],
                data['menuColor']['b'],
                data['menuColor']['opacity']),
        title: Row(
          children: [
            Image.network(
                width: 150,
                height: 40,
                fit: BoxFit.contain,
                data['logo'].toString()),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isPanelVisible ? Icons.arrow_back : Icons.arrow_forward),
            onPressed: () {
              setState(() {
                isPanelVisible = !isPanelVisible;
              });
            },
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextButton(
              child: CircleAvatar(
                backgroundImage: NetworkImage(data['userImage'].toString()),
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 350,
                          child: UserData(),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          AnimatedContainer(
            height: MediaQuery.of(context).size.height,
            width: isPanelVisible ? 250 : 50, // Adjust width for icons only
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: SingleChildScrollView(
              reverse: false,
              child: Column(
                children: _menuDinamicCreate(data['menus']),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child:  Card(
                child: _contextMenuCreateDinamic(data['menus']),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ListTile> _menuDinamicCreate(List<dynamic> listMapTitle) {
    List<ListTile> titleList = [];
    listMapTitle.forEach((element) {
      bool selec = false;
      if (selectedMenu == element['key']) selec = true;
      titleList.add(
        ListTile(
          selected: selec,
          key: Key(element['key']),
          trailing: isPanelVisible ? Text(element['trailing']) : null,
          iconColor: Color.fromRGBO(
              element['iconColor']['r'],
              element['iconColor']['g'],
              element['iconColor']['b'],
              element['iconColor']['opacity']),
          tileColor: Color.fromRGBO(
              element['tileColor']['r'],
              element['tileColor']['g'],
              element['tileColor']['b'],
              element['tileColor']['opacity']),
          selectedColor: Color.fromRGBO(
              element['selectedColor']['r'],
              element['selectedColor']['g'],
              element['selectedColor']['b'],
              element['selectedColor']['opacity']),
          selectedTileColor: Color.fromRGBO(
              element['selectedTileColor']['r'],
              element['selectedTileColor']['g'],
              element['selectedTileColor']['b'],
              element['selectedTileColor']['opacity']),
          hoverColor: Color.fromRGBO(
              element['hoverColor']['r'],
              element['hoverColor']['g'],
              element['hoverColor']['b'],
              element['hoverColor']['opacity']),
          textColor: Color.fromRGBO(
              element['textColor']['r'],
              element['textColor']['g'],
              element['textColor']['b'],
              element['textColor']['opacity']),
          subtitle: isPanelVisible ? Text(element['subtitle']) : null,
          leading: getIcon(element['icon']),
          title: isPanelVisible ? Text(element['title']) : null,
          onTap: () {
            setState(() {
              selectedMenu = element['key'];
            });
          },
        ),
      );
    });

    return titleList;
  }


   Widget _contextMenuCreateDinamic(List<dynamic> widgetsMenu) {
    Widget widgetPaint;
    widgetPaint = const Text("Menu principal");
    widgetsMenu.forEach((data) {
      if (selectedMenu == data['key']) {
        widgetPaint = Text('Menú de ' + data['title']);
      }
    });
    return widgetPaint;
  }
}
