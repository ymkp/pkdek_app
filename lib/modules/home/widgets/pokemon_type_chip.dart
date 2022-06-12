import 'package:flutter/material.dart';
import 'package:poke/const/theme.dart';
import 'package:poke/shared/utils/type_color_helper.dart' as color_helper;

/// Pokemon type chip.
/// Color is based on its type name
class PokemonTypeChip extends StatelessWidget {
  final String type;
  const PokemonTypeChip(this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: color_helper.getPokemonTypeColor(type), borderRadius: BorderRadius.circular(4), boxShadow: const [shadow1]),
      child: Text(
        type.toUpperCase(),
        style: kTextMedium500.copyWith(color: Colors.white),
      ),
    );
  }
}
