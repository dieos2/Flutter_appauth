import 'dart:convert';
import 'package:flutter/material.dart';
import 'Noticias.dart';
import 'package:http/http.dart' as http;

Future getListaDeNoticias() async{

  var data = await http.get("http://api.sgn.net.br/v2/portal/121/principais");

  List<Noticia> noticias = [];



  return parseNoticias(data.body);

}



List<Noticia> parseNoticias(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Noticia>((json) => Noticia.fromJson(json)).toList();
}

