class ShortPokemon {
  final int id;
  final String name;

  final String avatar;

  const ShortPokemon(
      {required this.id, required this.name, required this.avatar});

  factory ShortPokemon.fromJson(Map<String, dynamic> json) {
    return ShortPokemon(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}

class Pokemon {}
