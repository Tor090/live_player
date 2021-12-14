import 'package:equatable/equatable.dart';

/// Class [User] for create it's copy when we sign in.
class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');
}
