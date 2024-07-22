import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }
}