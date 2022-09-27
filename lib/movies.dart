import 'dart:convert';

import 'package:exemplo_api/api.dart';
import 'package:exemplo_api/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MoviesListView extends StatefulWidget {
  const MoviesListView({Key? key}) : super(key: key);

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  List<Movie> movies = List<Movie>.empty(); // Lista dos filmes
  String search = "star%20trek"; // Plavra chave da pesquisa

  // Construtor, atualiza com setState a lista de filmes.
  _MoviesListViewState() {
    Api.getMovie(search).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body); // Usamos um iterator
        movies = lista.map((model) => Movie.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Filmes"),
      ),
      // Aqui vem nossa lista
      body: ListView.builder(
        itemCount: movies.length, // quantidade de elementos
        // Os elementos da lista
        itemBuilder: (context, index) {
          // Vai ser um item de lista tipo ListTile
          return ListTile(
            // Uma imagem de avatar redondinho com a imagem do filme
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                movies[index].image,
              ),
            ),
            // No título é o nome do filme
            title: Text(
              movies[index].name,
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            // No subtítulo colocamos o link
            subtitle: Text(movies[index].link),
            // Ação de clicar
            onTap: () {
              // Abrimos uma nova página, outra classe, que está no arquivo
              // detail.dart. Veja que é um MaterialPageRote, tipo o
              // MaterialApp, só que é só uma página nova.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(movies[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
