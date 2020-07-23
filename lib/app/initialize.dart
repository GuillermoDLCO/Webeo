import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webeoapp/app/router.gr.dart';
import 'package:webeoapp/lang/localizations.dart';
import 'package:webeoapp/services/api.dart';
import 'package:webeoapp/services/token.dart';

import 'locator.dart';

class Initialize {
  BuildContext context;
  final Token _token = locator<Token>();
  final Api _api = locator<Api>();

  setPage(String home) {
    runApp(
      OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xFF2f3640),
            accentColor: Color(0xFF353b48),
            textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
            ).apply(
              bodyColor: Color(0xFF232832),
              displayColor: Color(0xFF232832),
            ),
          ).copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [Locale("es"), Locale("en"), Locale("pt")],
          onGenerateRoute: Router().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: home,
        ),
      ),
    );
  }

  Initialize() {
    _token.hasToken().then(
      (tokenResponse) {
        if (tokenResponse == true) {
          _api.inSessionUser().then((response) {
            setPage(Routes.loginViewRoute);
          }).catchError((error) {
            _token.deleteToken();
            setPage(Routes.loginViewRoute);
          });
        } else {
          setPage(Routes.loginViewRoute);
        }
      },
    );
  }
}
