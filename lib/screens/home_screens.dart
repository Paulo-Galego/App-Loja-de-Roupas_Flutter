import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(), //não permite que arraste para o lado
      children: [
        Container(color: Colors.yellow,),
        Container(color: Colors.red,)
      ],
    );
  }
}
