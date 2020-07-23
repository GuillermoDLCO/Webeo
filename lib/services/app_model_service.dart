import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppModel extends ChangeNotifier {
  int _currentIndex = 0;
  VoidCallback _openDrawer;

  int get currentIndex => _currentIndex;

  VoidCallback get openDrawer => _openDrawer;

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setOpenDrawer(VoidCallback opendrawer){
    _openDrawer = opendrawer;
  }
}
