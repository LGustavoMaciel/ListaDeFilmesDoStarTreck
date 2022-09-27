import 'package:exemplo_api/movies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lista de Filmes',
      debugShowCheckedModeBanner: false,
      home: MoviesListView(),
    );
  }
}
