import 'dart:async';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'Usuario.dart';
import 'http_util.dart' as http;

class UserModel extends Model {

  Usuario usuarioConectado;
  int _counter = 0;
  bool _isBusy = false;
  FlutterAppAuth appAuth = FlutterAppAuth();
  String _codeVerifier;
  String _authorizationCode;
  String _refreshToken;

  String _accessToken;
  TextEditingController _authorizationCodeTextController =
  TextEditingController();
  TextEditingController _accessTokenTextController = TextEditingController();
  TextEditingController _accessTokenExpirationTextController =
  TextEditingController();

  TextEditingController _idTokenTextController = TextEditingController();
  TextEditingController _refreshTokenTextController = TextEditingController();



  String _clientId = 'redeapp';
  String _redirectUrl = 'br.net.redeid.loginoauth:/oauthredirect';
  String _issuer = 'https://redeid.net.br/ids/';
  String _discoveryUrl =
      'https://redeid.net.br/ids/.well-known/openid-configuration';
  String _userinfourl = 'https://redeid.net.br/ids/connect/userinfo';
  String _token = '';
  List<String> _scopes = [
    'openid',
    'profile',
    'email'
  ];


  AuthorizationServiceConfiguration _serviceConfiguration =
  AuthorizationServiceConfiguration(
      'https://redeid.net.br/ids/connect/authorize',
      'https://redeid.net.br/ids/connect/token');


  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  Future addListener(VoidCallback listener) async {
    super.addListener(listener);
    Future.delayed(Duration(seconds: 4)).then((_) async {

    });
  }

  void signIn() async {

    isLoading = true;
    notifyListeners();

   await authorize();
    usuarioConectado = await getUserInfo();
//   await _loadCurrentUser();
   isLoading = false;
   notifyListeners();
  }

  void signOut() async {
//    await _auth.signOut();
//
//    userData = Map();
//    firebaseUser = null;

    notifyListeners();
  }

   bool isLoggedIn(){
    return usuarioConectado != null;
  }

  Future<Null> _loadCurrentUser() async {
    if(usuarioConectado == null)
      usuarioConectado = await getUserInfo();
    if(usuarioConectado != null){
      if(userData["name"] == null){

      }
    }
    notifyListeners();
  }




  authorize() async {

//    var result = await appAuth.authorizeAndExchangeCode(
//      AuthorizationTokenRequest(
//        _clientId,
//        _redirectUrl,
//        discoveryUrl: _discoveryUrl,
//        scopes: _scopes,
//      ),
//    );
    var result = await appAuth.authorize(
      AuthorizationRequest(_clientId, _redirectUrl,
          discoveryUrl: _discoveryUrl,
          scopes: _scopes,
          issuer: _issuer,
          serviceConfiguration: _serviceConfiguration),
    );
    var resultToken = await appAuth.token(TokenRequest(_clientId, _redirectUrl,
        authorizationCode: result.authorizationCode,
        discoveryUrl: _discoveryUrl,
        codeVerifier: null, //result.codeVerifier,
        scopes: _scopes,
        clientSecret: "redeparaapp"));
    _processTokenResponse(resultToken);
// NOTE: Calling this function here would crash the app.

  }
  Future<Usuario> getUserInfo() async {



    var uri = _userinfourl;
    if (uri == null) {
      throw new UnsupportedError("Issuer does not support userinfo endpoint.");
    }
    var user = await _get(uri);
    return  new Usuario.fromJson(user);

  }

  Future _get(uri) async {

    return http
        .get(uri, headers: {"authorization": "Bearer ${_accessToken}"});

  }
  void _processAuthTokenResponse(AuthorizationTokenResponse response) {

    _accessToken = _accessTokenTextController.text = response.accessToken;
    _idTokenTextController.text = response.idToken;
    _refreshToken = _refreshTokenTextController.text = response.refreshToken;
    _accessTokenExpirationTextController.text =
        response.accessTokenExpirationDateTime?.toIso8601String();

  }

  void _processAuthResponse(AuthorizationResponse response) {

    // save the code verifier as it must be used when exchanging the token
    _codeVerifier = response.codeVerifier;
    _authorizationCode =
        _authorizationCodeTextController.text = response.authorizationCode;
    _isBusy = false;

  }

  void _processTokenResponse(TokenResponse response) {

    _accessToken = _accessTokenTextController.text = response.accessToken;
    _idTokenTextController.text = response.idToken;
    _refreshToken = _refreshTokenTextController.text = response.refreshToken;
    _accessTokenExpirationTextController.text =
        response.accessTokenExpirationDateTime?.toIso8601String();

  }


}