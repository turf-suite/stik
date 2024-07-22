
import 'package:stik/core/auth/user.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User? user;
}