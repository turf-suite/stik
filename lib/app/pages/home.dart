import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }
}