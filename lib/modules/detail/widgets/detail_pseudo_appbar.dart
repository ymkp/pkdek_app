import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/const/theme.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/modules/home/widgets/pokemon_type_chip.dart';
import 'package:poke/routes/app_pages.dart';
import 'package:poke/shared/utils/string_helper.dart' as string_helper;

/// Appbar in Detail Screen
/// there is no Willpopscope use, so IOS navigation might still works
class DetailPseudoAppbar extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                // Get.back();
                Navigator.popUntil(context, (route) {
                  if (route.isFirst) {
                    Get.offNamed(Routes.home);
                    return true;
                  } else {
                    return false;
                  }
                });
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 25,
              )),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      controller.detail.name.toUpperCase(),
                      style: tsCardTitleTextStyle,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      string_helper.nationalDexNumber(controller.detail.id),
                      style: tsCardTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  children: controller.detail.types.map((e) => PokemonTypeChip(e)).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
