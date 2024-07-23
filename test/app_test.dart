import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stik/core/auth/bloc.dart';
import 'package:stik/core/auth/event.dart';
import 'package:stik/core/auth/state.dart';
import 'package:stik/core/auth/user.dart';
import 'package:stik/core/auth/user_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

import './app_test.mocks.dart';

User generateRandomUser() {
  return User(
    id: Uuid(),
    firstName: faker.person.firstName(),
    lastName: faker.person.lastName(),
    email: faker.company.name(),
  );
}

@GenerateNiceMocks([MockSpec<UserRepository>()])
void main() {
  final userRepository = MockUserRepository();
  final user = generateRandomUser();
  //final user = MockUser();
  group(AuthenticationBloc, () {
    late AuthenticationBloc bloc;
    late Stream<AuthenticationStatus> mockStream;

    setUp(() {
      bloc = AuthenticationBloc(userRepository);
      mockStream = Stream<AuthenticationStatus>.fromIterable([
        AuthenticationStatus.unauthenticated,
        AuthenticationStatus.authenticated,
      ]);
      when(userRepository.tryGetUser())
        .thenAnswer((_) async => user);
    });

    blocTest(
      'UnAuthenticated status emits on unauthenticated status added',
      build: () => bloc,
      act: (authBloc) => authBloc.add(AuthenticationStatusChanged(AuthenticationStatus.unauthenticated)),
      expect: () => [const AuthenticationState.unauthenticated()],
    );

    blocTest(
      'Authenticated status emits on authenticated status added',
      build: () => bloc,
      act: (authBloc) => authBloc.add(AuthenticationStatusChanged(AuthenticationStatus.authenticated)),
      expect: () => [AuthenticationState.authenticated(user)],
    );

    test('initial auth state is set correctly', () => {
      when(userRepository.tryGetUser())
        .thenAnswer((_) async => user),
      when(userRepository.authStatusUpdates)
        .thenAnswer((_) => mockStream),
      expect(bloc.state.status, equals(AuthenticationStatus.unknown))
    });
  });
}