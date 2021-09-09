import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  late final List<Pelicula> peliculas;

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: .23);

  final Function siguientePagina;

  MovieHorizontal({required this.peliculas, required this.siguientePagina});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * .2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _tarjeta(context, peliculas[i]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId = '${pelicula.id}-poster';

    final tarjeta = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                    height: 100.0)),
          ),
          Text(pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption)
        ]));

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        print(pelicula.title);

        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
