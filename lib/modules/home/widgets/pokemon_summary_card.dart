import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/shared/models/pokemon_summary_model.dart';

class PokemonSummaryCard extends StatelessWidget {
  const PokemonSummaryCard(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonSummaryModel>(
      builder: (context, data) {
        if (data.hasError) {}
        if (data.hasData) {
        } else {}
      },
    );
  }
}
