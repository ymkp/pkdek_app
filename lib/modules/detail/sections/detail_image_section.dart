import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/const/settings.dart' as settings;
import 'package:poke/routes/app_pages.dart';
import 'package:poke/shared/widgets/custom_cached_image_container.dart';

/// used in detail screen, on image section.
/// containing 3 pokemon images.
/// press the left or right one to navigate to its detail screen
class DetailImageSection extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (controller.detail.id == 0)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.width / 6,
                  )
                : InkWell(
                    onTap: () {
                      Get.offNamed('${Routes.detail}/${controller.detail.id - 1}');
                      // controller.getPokemonDetail((controller.detail.id - 1).toString());
                    },
                    child: CustomCachedImageContainer(
                      imageURL: '${settings.getPokemonSpriteIMG}${controller.detail.id - 1}.png',
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.width / 6,
                    ),
                  ),
            CustomCachedImageContainer(
              imageURL: '${settings.getPokemonHomeIMG}${controller.detail.id}.png',
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 3,
            ),
            InkWell(
              onTap: () {
                Get.offNamed('${Routes.detail}/${controller.detail.id + 1}');

                // controller.getPokemonDetail((controller.detail.id + 1).toString());
              },
              child: CustomCachedImageContainer(
                imageURL: '${settings.getPokemonSpriteIMG}${controller.detail.id + 1}.png',
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.width / 6,
              ),
            ),
          ],
        ));
  }
}
