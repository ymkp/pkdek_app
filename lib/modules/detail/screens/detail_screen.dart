import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/modules/detail/sections/detai_entries_section.dart';
import 'package:poke/modules/detail/sections/detail_image_section.dart';
import 'package:poke/modules/detail/sections/detail_stat_section.dart';
import 'package:poke/modules/detail/sections/detail_summary_section.dart';
import 'package:poke/modules/detail/widgets/detail_pseudo_appbar.dart';
import 'package:poke/shared/utils/type_color_helper.dart' as color_helper;
import 'package:poke/shared/widgets/loading_widget.dart';

/// Used in detail screen
class DetailScreen extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.detail.types.isEmpty ? Colors.white : color_helper.getPokemonTypeColor(controller.detail.types.first).withAlpha(100),
        body: (controller.detailState == DetailState.loading)
            ? const Center(child: LoadingWidget())
            : SafeArea(
                child: Column(
                  children: [
                    DetailPseudoAppbar(),
                    Expanded(
                      flex: 1,
                      child: DetailImageSection(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              const TabBar(
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: 'SUMMARY'),
                                  Tab(text: 'STAT'),
                                  Tab(text: 'ENTRIES'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    DetailSummarySection(),
                                    DetailStatSection(),
                                    DetailEntriesSection(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
