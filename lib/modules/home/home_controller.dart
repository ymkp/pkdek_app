import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:poke/shared/models/pokemon_summary_model.dart';
import 'package:poke/shared/services/api_service.dart';
import 'package:poke/const/settings.dart' as settings;

enum HomeListState { ok, loading, error, fetch, fetchErr }

class HomeController extends GetxController {
  final RxList<String> _pokemonNames = <String>[].obs;
  List<String> get pokemonNames => _pokemonNames.toList();
  final Rx<HomeListState> _state = HomeListState.ok.obs;
  HomeListState get state => _state.value;
  final ApiService _api = Get.find<ApiService>();
  final Rxn<String> _nextPage = Rxn<String>();
  String? get nextPage => _nextPage.value;
  final RxInt _page = 0.obs;
  int get page => _page.value;

  @override
  onReady() {
    getPokemon();
  }

  /// Get pokemon names in pokeapi
  /// I think it's the most efficient way to fetch name
  /// without getting unnecessary data
  Future<void> getPokemon({int page = 1}) async {
    _page.value = page;
    if (page == 1) {
      _state.value = HomeListState.loading;
    } else {
      _state.value = HomeListState.fetch;
    }
    try {
      final res = await _api.get(url: settings.getPokemonURL, query: {
        'offset': (page - 1) * 20,
        'limit': 20,
      });
      List<String> ns = (res['results'] as List).map((e) => e['name'].toString()).toList();
      _nextPage.value = res['next'];
      if (page == 1) {
        _pokemonNames.assignAll(ns);
      } else {
        _pokemonNames.addAll(ns);
      }
      _state.value = HomeListState.ok;
    } catch (e) {
      log('err : $e');
      if (page == 1) {
        _state.value = HomeListState.error;
      } else {
        _state.value = HomeListState.fetchErr;
      }
    }
  }

  /// Get pokemon types from pkdek.rutesatu
  /// I think it's the most efficient way to fetch name
  /// without getting unnecessary data
  Future<PokemonSummaryModel> getPokemonMini(String name) async {
    try {
      final res = await _api.get(url: '${settings.getPokemonMiniURL}/$name');
      return PokemonSummaryModel.fromJson(res);
    } catch (e) {
      if (kDebugMode) print('failed to get mini : $e');
      return PokemonSummaryModel(natDex: 0, name: name, types: []);
    }
  }
}
