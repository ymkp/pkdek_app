import 'package:flutter/material.dart';
import 'package:poke/const/theme.dart';
import 'package:poke/shared/utils/type_color_helper.dart' as color_helper;

class PokemonTypeChip extends StatelessWidget {
  final String type;
  const PokemonTypeChip(this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: color_helper.getPokemonTypeColor(type), borderRadius: BorderRadius.circular(4), boxShadow: const [shadow1]),
      child: Text(
        type,
        style: kTextMedium500.copyWith(color: Colors.white),
      ),
    );
  }
}
