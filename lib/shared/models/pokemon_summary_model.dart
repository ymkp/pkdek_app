import 'dart:developer';

/// model for pokemon summary mini
class PokemonSummaryModel {
  int natDex;
  String name;
  List<String> types;

  PokemonSummaryModel({
    required this.natDex,
    required this.name,
    required this.types,
  });

  factory PokemonSummaryModel.fromJson(Map<String, dynamic> json) {
    return PokemonSummaryModel(
      natDex: json['natDex'] ?? 0,
      name: json['name'] ?? '',
      types: json['types'] != null ? (json['types'] as List).map((e) => e.toString()).toList() : [],
    );
  }
}
