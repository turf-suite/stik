import 'package:flutter/material.dart';
import 'package:stik/app/app.dart';
import 'package:stik/core/auth/user_repository.dart';

void main() {
  runApp(App(userRepository: SupabaseUserRepository()));
}
