import 'package:get/get.dart';
import 'package:poke/shared/models/pokemon_detail_model.dart';
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

  Future<void> getPokemon({int page = 1}) async {
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
      if (page == 1) {
        _pokemonNames.assignAll(ns);
      } else {
        _pokemonNames.addAll(ns);
      }
      _state.value = HomeListState.ok;
    } catch (e) {
      if (page == 1) {
        _state.value = HomeListState.error;
      } else {
        _state.value = HomeListState.fetchErr;
      }
    }
  }

  Future<PokemonSummaryModel> getPokemonDetail(String name) async {
    final res = await _api.get(url: '${settings.getPokemonURL}/$name');
    return PokemonSummaryModel.fromJson(res);
  }
}
