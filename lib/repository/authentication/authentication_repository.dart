import 'dart:async';

/// State of authentication on program.
enum AuthenticationStatus { unknown, authenticated, unauthenticated, unlogined }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();


  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

/// Method [logIn] for sign in into this program.
  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void unLogin() {
    _controller.add(AuthenticationStatus.unlogined);
  }

  void dispose() => _controller.close();
}
