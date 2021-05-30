import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Esta função cria o fundo da tela
    Widget _buildBodyBack() =>Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 211, 118, 130), //CORES DO GRADIENTE
          Color.fromARGB(255, 253, 181, 168),
        ],
        begin: Alignment.topLeft, //onde começa o gradiente
        end: Alignment.bottomRight //onde termina
      )
    ),
    );

    return Stack(
      children: [
        _buildBodyBack(), //fundo
        CustomScrollView( //em cima do fundo
          slivers: [
            SliverAppBar( //barra flutante
              floating: true,
              pinned: false,
              snap: true, //a barra reaparece
              backgroundColor: Colors.transparent, //cor de fundo
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
              .collection("home").orderBy("pos").getDocuments(),
              // ignore: missing_return
              builder: (context, snapshot){
                if(!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  return SliverStaggeredGrid.count(
                      crossAxisCount: 2, //dois blocos na horizontal
                    mainAxisSpacing: 1.0, //espaço entre os blocos
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.documents.map(
                        (doc){
                          return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                        }
                    ).toList(),
                    children: snapshot.data.documents.map(
                        (doc){
                          return FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: doc.data["image"],
                            fit: BoxFit.cover,
                          );
                        }
                    ).toList(),
                  );
              },
            )
          ],
        )

      ],
    );
  }
}
