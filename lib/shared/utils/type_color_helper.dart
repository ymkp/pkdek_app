import 'package:flutter/material.dart';
import 'package:poke/const/theme.dart';

const Map<String, Color> _typeColor = {
  'normal': cGreyNormal,
  'fire': cOrangeFire,
  'fighting': cRedFighting,
  'grass': cGreenGrass,
  'poison': cPurplePoison,
  'electric': cYellowElectric,
  'ground': cBrownGround,
  'psychic': cPinkPsychic,
  'rock': cBrownRock,
  'ice': cBlueIce,
  'bug': cGreenBug,
  'dragon': cBlueDragon,
  'ghost': cBlueGhost,
  'dark': cBlackDark,
  'steel': cGreySteel,
  'fairy': cPinkFairy,
};

/// get pokemon type color based on its type
Color getPokemonTypeColor(String type) {
  return _typeColor[type] ?? cGreyUnknown;
}
