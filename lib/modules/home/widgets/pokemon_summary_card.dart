import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/const/theme.dart';
import 'package:poke/modules/home/home_controller.dart';
import 'package:poke/modules/home/widgets/pokemon_type_chip.dart';
import 'package:poke/shared/models/pokemon_summary_model.dart';
import 'package:poke/shared/widgets/custom_cached_image_container.dart';
import 'package:poke/shared/widgets/loading_widget.dart';
import 'package:poke/const/settings.dart' as settings;
import 'package:poke/shared/utils/type_color_helper.dart' as color_helper;

class PokemonSummaryCard extends GetView<HomeController> {
  const PokemonSummaryCard(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonSummaryModel>(
      future: controller.getPokemonMini(name),
      builder: (context, data) {
        if (data.hasData) {
          return InkWell(
            child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color_helper.getPokemonTypeColor(data.data!.types.isNotEmpty ? data.data!.types.first : '??').withAlpha(100),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CustomCachedImageContainer(
                        imageURL: '${settings.getPokemonHomeIMG}${data.data!.natDex}.png',
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.data!.name.toUpperCase(),
                                style: tsCardTitleTextStyle,
                              ),
                              const SizedBox(height: 15),
                              ...data.data!.types.map((e) => PokemonTypeChip(e)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '#${data.data!.natDex}',
                            style: tsCardTitleTextStyle,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          );
        } else {
          return LoadingWIdget();
        }
      },
    );
  }
}
