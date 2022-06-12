import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke/modules/detail/detail_controller.dart';

/// This section only has weight and height of pokemon
class DetailSummarySection extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildContent(
          'Height',
          Text(
            '${_divideItBy10(controller.detail.height)}m',
          ),
        ),
        _buildContent(
          'Weight',
          Text(
            '${_divideItBy10(controller.detail.weight)}KG',
          ),
        ),
        if (controller.detail.abilities.isNotEmpty)
          _buildContent(
            'Abilities',
            Wrap(
              spacing: 5,
              children: controller.detail.abilities
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(e.ability),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildContent(String title, Widget content) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(title),
          ),
          Expanded(
            flex: 3,
            child: content,
          ),
        ],
      ),
    );
  }

  String _divideItBy10(int i) {
    return (i / 10).toStringAsFixed(1);
  }
}
