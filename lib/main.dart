import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokemons/components/PokemonCard.dart';
import 'package:flutter_pokemons/data/data.dart';
import 'package:flutter_pokemons/models/Pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokedex',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Pokedex')),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ShortPokemon>> pokemons;

  @override
  void initState() {
    super.initState();
    pokemons = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShortPokemon>>(
        future: pokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext buildContext, int index) {
                    return PokemonCard(pokemon: snapshot.data![index]);
                  }),
            );
          } else if (snapshot.hasError) {
            return Text('Error, please try again.');
          }

          return Center(
            child: const CircularProgressIndicator(),
          );
        });
  }
}
