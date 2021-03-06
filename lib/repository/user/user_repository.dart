import 'dart:async';
import 'package:live_player/repository/user/user.dart';
import 'package:uuid/uuid.dart';

/// Class [UserRepository] for get copy of User.
class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(const Uuid().v4()),
    );
  }
}
