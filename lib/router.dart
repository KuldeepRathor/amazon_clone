// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:amazon_clone/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'features/auth/screens/auth_screen.dart';
import 'common/widgets/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => AuthScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => BottomBar(),
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
