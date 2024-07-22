import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stik/app/pages/home.dart';
import 'package:stik/app/pages/login.dart';
import 'package:stik/app/pages/splash.dart';
import 'package:stik/core/auth/bloc.dart';
import 'package:stik/core/auth/state.dart';
import 'package:stik/core/auth/user_repository.dart';

class App extends StatefulWidget {
  final UserRepository userRepository;

  const App({super.key, required this.userRepository});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final UserRepository _userRepository;

  @override
  void initState() {
    _userRepository = widget.userRepository;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return RepositoryProvider.value(
      value: _userRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          _userRepository,
        ),
        child: const AppView(),
      ),
    );
  }

  @override
  void dispose() {
    // close stream connection
    _userRepository.dispose();
    super.dispose();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}