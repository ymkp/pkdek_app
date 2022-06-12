import 'package:get/get.dart';
import 'package:poke/shared/models/pokemon_detail_model.dart';
import 'package:poke/shared/services/api_service.dart';
import 'package:poke/const/settings.dart' as settings;

enum DetailState { ok, loading, error }

class DetailController extends GetxController {
  DetailController(String s) {
    nameOrDex = s;
  }
  late final String nameOrDex;
  final Rx<PokemonDetailModel> _detail = PokemonDetailModel.init().obs;
  PokemonDetailModel get detail => _detail.value;
  final Rx<DetailState> _detailState = DetailState.ok.obs;
  DetailState get detailState => _detailState.value;

  final ApiService _api = Get.find<ApiService>();

  @override
  onReady() {
    getPokemonDetail(nameOrDex);
  }

  /// Get Pokemon Detail then set value in detail
  Future<void> getPokemonDetail(String name) async {
    try {
      _detailState.value = DetailState.loading;
      final res = await _api.get(url: '${settings.getPokemonURL}/$name');
      _detail.value = PokemonDetailModel.fromJson(res);
      _detailState.value = DetailState.ok;
    } catch (e) {
      _detailState.value = DetailState.error;
    }
  }
}
