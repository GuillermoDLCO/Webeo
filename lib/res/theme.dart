import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color primaryColor = const Color(0xFF2980b9);
  static const Color secondaryColor = const Color(0xFF273c75);

  static const primaryGradient = const LinearGradient(
    colors: const [primaryColor, secondaryColor],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
