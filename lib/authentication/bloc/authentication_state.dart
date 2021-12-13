import 'package:equatable/equatable.dart';
import 'package:live_player/repository/authentication/authentication_repository.dart';
import 'package:live_player/repository/user/user.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.unlogined()
      : this._(status: AuthenticationStatus.unlogined);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
