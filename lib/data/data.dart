import 'dart:convert';
import 'dart:async';

import 'package:flutter_pokemons/constants.dart';
import 'package:flutter_pokemons/models/Api.dart';
import 'package:flutter_pokemons/models/Pokemon.dart';
import 'package:http/http.dart' as http;

Future<List<ShortPokemon>> fetchPokemons() async {
  final rawResponse = await http.get(Uri.parse('${POKEMON_API_URL}/pokemon/'));

  final response = jsonDecode(rawResponse.body);

  List<dynamic> test = response['results'];

  List<ShortPokemon> futuresList = [];
  await Future.wait(test.map((e) async {
    final rawPokemonResponse = await http.get(Uri.parse(e['url']));
    final pokemonResponse = jsonDecode(rawPokemonResponse.body);

    final shortPokemon = ShortPokemon(
      name: pokemonResponse['name'],
      avatar: pokemonResponse['sprites']['other']['home']['front_default'],
      id: pokemonResponse['id'],
    );

    futuresList.add(shortPokemon);
  }));

  return futuresList;
}

fetchPokemon() {}
