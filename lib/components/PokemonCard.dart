import 'package:flutter/material.dart';
import 'package:flutter_pokemons/functions/capitalizeFirstLetter.dart';
import 'package:flutter_pokemons/models/Pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final ShortPokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
        // decoration: BoxDecoration(color: Color.fromRGBO(158, 158, 158, 1)),
        // alignment: Alignment.center,
        child: InkWell(
      onTap: () {
        print('Tapped!');
      },
      child: Column(
        children: [
          Image.network(
            pokemon.avatar,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              capitalizeFirstLetter(pokemon.name),
              // style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    ));
  }
}
