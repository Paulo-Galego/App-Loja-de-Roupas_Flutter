import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  DrawerTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Material( //utilizando o material para obter um efeito visual ao clciar no icone...
      color: Colors.transparent,
      child: InkWell(
        onTap: (){

        },
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: Colors.black,
              ),
              SizedBox(width: 32.0), //colocando um espaço entre o ícone e o texto
              Text(text,style: TextStyle(
                fontSize: 16.0,
                color: Colors.black
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
