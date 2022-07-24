import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOption = 0;

  int get selectMenuOption {
    return _selectMenuOption;
  }

  set selectMenuOption(int i) {
    _selectMenuOption = i;
    notifyListeners();
  }
}
