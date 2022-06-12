import 'package:flutter/material.dart';

class ComingSoonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset('assets/images/wailoading.gif'), const Text('COMING SOON')],
    );
  }
}
