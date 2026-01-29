


import 'package:bwin_awale_game_app/routes/user_routes.dart';

extension AppRouteExtension on UserAppRoutes {
  String get path => this == UserAppRoutes.splashScreen ? "/" : "/$name";
}