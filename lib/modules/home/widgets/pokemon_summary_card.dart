import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/const/theme.dart';
import 'package:poke/modules/home/home_controller.dart';
import 'package:poke/modules/home/widgets/pokemon_type_chip.dart';
import 'package:poke/routes/app_pages.dart';
import 'package:poke/shared/models/pokemon_summary_model.dart';
import 'package:poke/shared/widgets/custom_cached_image_container.dart';
import 'package:poke/const/settings.dart' as settings;
import 'package:poke/shared/utils/type_color_helper.dart' as color_helper;
import 'package:poke/shared/utils/string_helper.dart' as string_helper;
import 'package:poke/shared/widgets/small_loading_widget.dart';

/// Card used in Homescreen
/// after pokemon names has been fetched from pokeapi,
/// get summary info from pkdek.rutesatu.com for types
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
            onTap: () => Get.toNamed('${Routes.detail}/$name'),
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
                            string_helper.nationalDexNumber(data.data!.natDex),
                            style: tsCardTitleTextStyle,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          );
        } else {
          return const SmallLoadingWidget();
        }
      },
    );
  }
}
