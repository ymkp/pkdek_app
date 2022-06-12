import 'package:flutter/material.dart';
import 'package:poke/shared/widgets/loading_widget.dart';

/// Loading screen while initiating hive box
class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoadingWidget()),
    );
  }
}
