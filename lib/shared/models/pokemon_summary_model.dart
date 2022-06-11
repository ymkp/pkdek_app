/// model for pokemon summary mini
class PokemonSummaryModel {
  int id;
  String name;
  List<String> types;
  String spriteImageUrl;

  PokemonSummaryModel({
    required this.id,
    required this.name,
    required this.types,
    required this.spriteImageUrl,
  });

  factory PokemonSummaryModel.fromJson(Map<String, dynamic> json) {
    return PokemonSummaryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      types: json['types'] ?? '',
      spriteImageUrl: json['spriteImageUrl'] ?? '',
    );
  }
}
