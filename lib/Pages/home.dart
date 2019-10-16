import 'package:flutter/material.dart';
import 'package:loginoauth/Model/ApiSGN.dart';
import 'package:loginoauth/Model/Noticias.dart';
import 'package:loginoauth/Model/Usuario.dart';

import 'DelhesNoticia.dart';

Widget listaDeNoticias() {
  return FutureBuilder(
      future: getListaDeNoticias(),
      builder: (BuildContext context, AsyncSnapshot projectSnap) {
        if (projectSnap.data == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Text("Carregando"),
              ],
            ),
          );
        } else {
          return ListView.builder(
              itemCount: projectSnap.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(projectSnap.data[index])));
                    },
                    child: Container(
                        child: Column(children: <Widget>[
                      Image.network("https://redepara.com.br/imagens/galeria/" +
                          projectSnap.data[index].id_galeria.toString() +
                          "/thumbs/" +
                          projectSnap.data[index].nome_foto),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 5, bottom: 0),
                          child: Center(
                              child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(projectSnap.data[index].chapeu,
                                style: TextStyle(
                                  color: Colors.red,
                                )),
                          ))),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Text(projectSnap.data[index].titulo,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)))),
                    ])));
              });
        }
      });
}

class ScreenWidget extends StatefulWidget {
  final Function onTap;

  const ScreenWidget({Key key, this.onTap}) : super(key: key);

  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends State<ScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Rede Carros", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: widget.onTap,
          child: Icon(Icons.menu),
        ),
      ),
      body: Center(
        child: listaDeNoticias(),
      ),
    );
  }
}
