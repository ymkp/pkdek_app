import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';
import 'package:poke/shared/widgets/coming_soon_widget.dart';

/// Used in pokedex entries section in detail screen
/// there is no content for this section yet
/// many data in pokedex entries, might complete this section
class DetailEntriesSection extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: ComingSoonWidget(),
        )
      ],
    );
  }
}
