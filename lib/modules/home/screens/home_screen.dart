import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/home/home_controller.dart';
import 'package:poke/modules/home/widgets/pokemon_summary_card.dart';

/// As the name says. This is the homescreen
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
                    /// Check if scroll is in the end edge of screen.
                    /// check if state is not in loading or fetch state.
                    /// check if next screen is still available
                    if (scrollInfo is ScrollEndNotification &&
                        scrollInfo.metrics.extentAfter == 0 &&
                        controller.state == HomeListState.ok &&
                        controller.nextPage != null) {
                      controller.getPokemon(page: controller.page + 1);
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
