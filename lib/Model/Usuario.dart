import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'http_util.dart' as http;

class Usuario extends Model{
   String sub;
   String email;
   String given_name;
   String picture;
   String family_name;

  Usuario();

  Usuario.fromJson(Map<String, dynamic> json)
      : sub = json['sub'],
        family_name = json['family_name'],
        given_name = json['given_name'],
        picture = json['picture'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {
        'sub': sub,
        'email': email,
        'family_name': family_name,
        'picture': picture,
        'given_name': given_name,
      };

}