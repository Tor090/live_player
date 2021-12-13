import 'package:flutter/material.dart';
import 'package:live_player/repository/authentication/authentication_repository.dart';
import 'package:live_player/repository/user/user_repository.dart';
import 'app.dart';

Future<void> main() async{
 runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));

}
