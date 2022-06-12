import 'package:flutter/material.dart';

/// Loading widget with .gif asset
class SmallLoadingWidget extends StatelessWidget {
  const SmallLoadingWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/pokeball_small.gif'),
        const Text('Loading . . .'),
      ],
    );
  }
}
