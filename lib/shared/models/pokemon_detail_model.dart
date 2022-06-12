class PokemonDetailModel {
  int id;
  String name;
  List<String> types;
  List<Ability> abilities;
  int height;
  String species;
  List<Stat> stats;
  int weight;

  PokemonDetailModel({
    required this.id,
    required this.name,
    required this.types,
    required this.abilities,
    required this.height,
    required this.species,
    required this.stats,
    required this.weight,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      types: json['types'] == null ? [] : List<String>.from(json["types"].map((e) => e['type']['name'].toString())),
      abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"].map((e) => Ability.fromJson(e))),
      height: json["height"] ?? 0,
      species: json['species']?['name'] ?? '',
      stats: json['stats'] == null ? [] : List<Stat>.from(json["stats"].map((e) => Stat.fromJson(e))),
      weight: json["weight"] ?? 0,
    );
  }

  factory PokemonDetailModel.init() {
    return PokemonDetailModel(
      id: 0,
      name: '',
      types: [],
      abilities: [],
      height: 0,
      weight: 0,
      species: '',
      stats: [],
    );
  }
}

class Ability {
  String ability;
  bool isHidden;

  Ability({
    required this.ability,
    required this.isHidden,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: json['ability']?['name'] ?? '',
        isHidden: json["is_hidden"] ?? false,
      );
}

class Stat {
  int baseStat;
  int effort;
  String stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"] ?? '?',
        effort: json["effort"] ?? '?',
        stat: json['stat']?['name'] ?? '',
      );
}
