import 'package:stik/core/auth/state.dart';

abstract class AuthenticationEvent {
  AuthenticationStatus status;

  AuthenticationEvent(this.status);
}

class AuthenticationStatusChanged extends AuthenticationEvent{
  AuthenticationStatusChanged(super.status);
}