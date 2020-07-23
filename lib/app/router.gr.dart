// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:webeoapp/ui/views/welcome/welcome_view.dart';
import 'package:webeoapp/ui/views/login/login_view.dart';

abstract class Routes {
  static const welcomeViewRoute = '/';
  static const loginViewRoute = '/login-view-route';
  static const all = {
    welcomeViewRoute,
    loginViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WelcomeView(),
          settings: settings,
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
