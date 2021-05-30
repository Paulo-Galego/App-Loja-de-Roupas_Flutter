import 'package:flutter/material.dart';
import 'package:miriamroupas/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Esta função cria o fundo da tela
    Widget _buildDrawerBack() =>Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241), //CORES DO GRADIENTE
                Colors.white
              ],
              begin: Alignment.topCenter, //onde começa o gradiente
              end: Alignment.bottomCenter //onde termina
          )
      ),
    );

    return Drawer(
     child: Stack(
       children: [
         _buildDrawerBack(),
         ListView(
           padding: EdgeInsets.only(left: 32.0,top: 16.0),
           children: [
             Container(
               margin: EdgeInsets.only(bottom: 8.0),
               padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
               height: 170.0,
               child: Stack(
                 children: [
                   Positioned(
                     top: 8.0,
                     left: 0.0,
                     child: Text("Miriam\nModas",
                     style: TextStyle(
                       fontSize: 34.0, fontWeight: FontWeight.bold),
                     ),
                   ),
                   Positioned(
                     left: 0.0,
                     bottom: 0.0,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Olá,",
                           style: TextStyle(
                             fontSize: 18.0,
                             fontWeight: FontWeight.bold
                           ),
                         ),
                         GestureDetector(
                           child: Text("Entre ou cadastre-se >",
                           style: TextStyle(
                             color: Theme.of(context).primaryColor,
                             fontSize: 16.0,
                             fontWeight: FontWeight.bold
                           ),
                           ),
                           onTap: (){

                           },
                         )
                       ],
                     ),
                   )
                 ],
               ),
             ),
             Divider(),
             DrawerTile(Icons.home,"Ínicio"),
             DrawerTile(Icons.list,"Produtos"),
             DrawerTile(Icons.location_on,"Onde me encontrar"),
             DrawerTile(Icons.playlist_add_check,"Meus Pedidos"),
           ],
         )
       ],
     ),
    );
  }
}
