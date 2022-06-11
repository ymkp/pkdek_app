import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/home/home_controller.dart';
import 'package:poke/modules/home/widgets/pokemon_summary_card.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: () async {
              await controller.getPokemon();
            },
            child: Obx(() => NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification &&
                            scrollInfo.metrics.extentAfter == 0 && // ? <-- bener2 mentok sampai ada splash-nya
                            controller.state == HomeListState.ok && //? <-- kondisi tambahan, cuma reload kalau lagi tidak loading
                            controller.nextPage != null //? <-- kondisi tambahan, cuma reload kalau bukan halaman/paginasi terakhir
                        ) {
                      controller.getPokemon(page: controller.page + 1); //? <-- yang dilakukan untuk get next items
                      return true;
                    }
                    return false;
                  },
                  child: GridView.count(
                    padding: const EdgeInsets.only(bottom: 15),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: controller.pokemonNames.map((e) => PokemonSummaryCard(e)).toList(),
                  ),
                ))),
      ),
    );
  }
}
