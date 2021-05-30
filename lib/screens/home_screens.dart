import 'package:flutter/material.dart';
import 'package:miriamroupas/tabs/home_tab.dart';
import 'package:miriamroupas/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(), //não permite que arraste para o lado
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,)
      ],
    );
  }
}
