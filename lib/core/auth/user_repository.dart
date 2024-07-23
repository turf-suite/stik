import 'dart:async';

import 'package:stik/core/auth/state.dart';
import 'package:stik/core/auth/user.dart';

abstract class UserRepository {
  final StreamController<AuthenticationStatus> _streamController = StreamController();

  UserRepository();

  Stream<AuthenticationStatus> get authStatusUpdates async* {
    final user = await tryGetUser();
    if (user == null) {
      yield AuthenticationStatus.unauthenticated;
    }
    else {
      yield AuthenticationStatus.authenticated;
    }
    yield* _streamController.stream;
  }

  Future<User> login(String email, String password);

  Future<User> signup(UserSignup newSignUp);

  Future<void> signout();

  Future<User?> tryGetUser();

  void dispose() {
    _streamController.close();
  }
}

class SupabaseUserRepository implements UserRepository {
  @override
  // TODO: implement _streamController
  StreamController<AuthenticationStatus> get _streamController => throw UnimplementedError();

  @override
  // TODO: implement authStatusUpdates
  get authStatusUpdates => throw UnimplementedError();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }

  @override
  Future<User> signup(UserSignup newSignUp) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<User?> tryGetUser() {
    // TODO: implement tryGetUser
    throw UnimplementedError();
  }
}