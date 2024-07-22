import 'dart:async';

import 'package:stik/core/auth/state.dart';
import 'package:stik/core/auth/user.dart';

abstract class UserRepository {
  final StreamController<AuthenticationStatus> _streamController = StreamController();

  UserRepository();

  get authStatusUpdates => _streamController;

  Future<User> login(String email, String password);

  Future<User> signup(UserSignup newSignUp);

  Future<void> signout();

  Future<User?> tryGetUser();

  void dispose() {
    _streamController.close();
  }
}