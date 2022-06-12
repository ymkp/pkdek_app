import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/shared/utils/type_color_helper.dart' as color_helper;

/// Used in BaseStat section.
/// percentage bar max value is 255
/// based on max stat on Pokemon.
/// Chansey has 255 HP stat.
class DetailStatSection extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: controller.detail.stats
              .map(
                (e) => Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(e.stat),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 30,
                        decoration: BoxDecoration(
                          color: color_helper.getStatColor(e.stat).withAlpha(100),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                height: 30,
                                width: (MediaQuery.of(context).size.width * 0.8) * (e.baseStat / 255),
                                decoration: BoxDecoration(
                                  color: color_helper.getStatColor(e.stat),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                e.baseStat.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
