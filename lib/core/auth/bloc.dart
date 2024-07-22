import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stik/core/auth/event.dart';
import 'package:stik/core/auth/state.dart';
import 'package:stik/core/auth/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  AuthenticationBloc(this._userRepository) : super(const AuthenticationState.unknown()) {
    // add a status changed event when the user repo perform auth logic and sends status to the stream
    _authenticationStatusSubscription = _userRepository.authStatusUpdates.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
    on<AuthenticationStatusChanged>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.unauthenticated:
          return emit(const AuthenticationState.unauthenticated());
        case AuthenticationStatus.authenticated:
          final user = await _userRepository.tryGetUser();
          return emit(AuthenticationState.authenticated(user!));
        case AuthenticationStatus.unknown:
          final user = await _userRepository.tryGetUser();
          return emit(
            user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated(),
          );
      }
    });
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}