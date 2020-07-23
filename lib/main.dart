import 'package:flutter/material.dart';

import 'app/initialize.dart';
import 'app/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Initialize();
}
