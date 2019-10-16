import 'package:flutter/material.dart';
import 'package:loginoauth/Model/Noticias.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:date_format/date_format.dart';
class DetailPage extends StatelessWidget {
  final Noticia noticia;

  DetailPage(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(noticia.titulo, style: TextStyle(color: Colors.white),),
          ),
        body:  SingleChildScrollView(
        child: Container(

          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 5,
                      bottom: 0),
                  child: Center(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            noticia.chapeu,
                            style: TextStyle(
                              color: Colors.red,
                            )),

                      ))),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: Text(noticia.titulo,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)))
              ),
             Image.network("https://redepara.com.br/imagens/galeria/" +
                  noticia.id_galeria.toString() +
                  "/thumbs/" +
                  noticia.nome_foto),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 5,
                      bottom: 0),
                  child: Center(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            formatDate(DateTime.parse(noticia.data_pub), [dd, '/', mm, '/',yyyy , ' ', hh, ':', nn]),
                            style: TextStyle(
                              color: Colors.red,
                            )),

                      ))),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: HtmlWidget(
                    noticia.texto, textStyle: TextStyle(fontSize: 25), )
              )


            ],
          ),
        ),
    ),
    );
  }
}