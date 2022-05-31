import 'package:flutter_modular/flutter_modular.dart';

/// Use a [RouteGuard] to verify a certain condition before redirect a user
/// to a specific page.

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/counter/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) {
    return Future.value(false);
  }
}
