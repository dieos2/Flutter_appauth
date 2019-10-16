import 'package:flutter/material.dart';
import 'package:loginoauth/Model/UserModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'home.dart';

class DrawerWidget extends StatefulWidget {
   @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();

}

class _DrawerWidgetState extends State<DrawerWidget> {

  int itemSelect = 0;
  Function navegaPagina() {

  }
  Widget _avatar() {
return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Color.fromARGB(255, 247, 190, 21),
          Colors.orange[600],
          Colors.orange[700],
          Colors.orange[800],
        ],
      ),

    ),
  child:  Padding(
      padding: EdgeInsets.all(18.0),

      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){

         return Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(

                  padding: EdgeInsets.all(18.0),
                  width: 130.0,
                  height: 130.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              !model.isLoggedIn() ? "" : model.usuarioConectado.picture)
                      )
                  )
              ),
              Container(height: 12.0, ),
              Text("ola, ${!model.isLoggedIn() ? "" : model.usuarioConectado.given_name + " " +model.usuarioConectado.family_name}", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),textAlign: TextAlign.center,),
              Text(!model.isLoggedIn() ? "" : model.usuarioConectado.email, style: TextStyle(fontSize: 15.0, color: Colors.white),),
            ],
          );
        },
      )
    )
);
  }
  Widget _listMenu() {

    return ListView(

      children: <Widget>[

        _avatar(),

        _tiles("INÍCIO", Icons.home, 0, (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenWidget()));}),
        _tiles("VEICULOS", MdiIcons.newspaper, 1, () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenWidget()));}),
       _tiles("PROMOÇÕES", Icons.gif, 2, () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenWidget()));}),
        Divider(),
        _tiles("SAIR", Icons.exit_to_app, 2, () {}),

      ],
    );

  }//cria o avatar com nome, email e imagem

 //cria cada item do menu
  Widget _tiles(String text, IconData icon, int item, Function onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo,),
      onTap: onTap,
      selected: item == itemSelect,
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
      child: _listMenu()),

    );

  }


}


