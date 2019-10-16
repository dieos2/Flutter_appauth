import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Model/UserModel.dart';
import 'Pages/home.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
@override
void initState(){
  firebaseMessaging.configure(
    onLaunch: (Map<String, dynamic> msg){
      print("onLaunch called $msg");
    },
    onResume: (Map<String, dynamic> msg){
      print("onResume called $msg");
    },
    onMessage: (Map<String, dynamic> msg){
      print("onMessage called $msg" );
    },


  );
firebaseMessaging.requestNotificationPermissions(
  const IosNotificationSettings(
    sound: true,
    alert: true,
    badge: true
  )
);
firebaseMessaging.getToken().then((token){
  update(token);
});
firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting){
  print('IOS Setting Registed');
});
}
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
                  child: MaterialApp(
                  title: "Rede Carros",
                  theme: ThemeData(
                      primarySwatch: Colors.yellow,
                      primaryColor: Color.fromARGB(255, 247, 190, 21)
                  ),
                  debugShowCheckedModeBanner: false,
                  home: ScreenWidget()
              ),
            );
          }

  }

update(String token) {
print(token);
var textValue = token;
//setState((){
//
//});
}

