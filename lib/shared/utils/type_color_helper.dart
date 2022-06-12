import 'package:flutter/material.dart';
import 'package:poke/const/theme.dart';

/// map for pokemon type's bulbapedia color
const Map<String, Color> _typeColor = {
  'normal': cGreyNormal,
  'fire': cOrangeFire,
  'water': cBlueWater,
  'flying': cBlueFlying,
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

/// map for pokemon stat's bulbapedia color
const Map<String, Color> _statColor = {
  'hp': cRedFighting,
  'attack': cOrangeFire,
  'defense': cYellowElectric,
  'special-attack': cBlueWater,
  'special-defense': cGreenGrass,
  'speed': cPinkPsychic
};

/// get pokemon type color based on its type
Color getPokemonTypeColor(String type) {
  return _typeColor[type] ?? cGreyUnknown;
}

/// get pokemon stat color based on its stat
Color getStatColor(String stat) {
  return _statColor[stat] ?? cGreyUnknown;
}
