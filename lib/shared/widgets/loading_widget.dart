import 'package:flutter/material.dart';

/// Loading widget with .gif asset
class LoadingWidget extends StatelessWidget {
  const LoadingWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/wailoading.gif'),
        const Text('Loading . . .'),
      ],
    );
  }
}
