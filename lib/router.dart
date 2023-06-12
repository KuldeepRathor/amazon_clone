import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => Scaffold(
          body: Center(
            child: Text(
              'Screen does not exist',
            ),
          ),
        ),
      );
  }
}
