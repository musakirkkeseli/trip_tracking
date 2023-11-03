import 'package:flutter/widgets.dart';

class AnimatedProvider with ChangeNotifier {
  bool _isVisibleDate = false;
  bool _isAnimatedController = false;

  bool get isVisible => _isVisibleDate;
  bool get isOpen => _isAnimatedController;

  void changeAnimated() {
    _isAnimatedController = !_isAnimatedController;
    notifyListeners();
  }

  void changeVisible(bool isVisible) {
    _isVisibleDate = isVisible;
    notifyListeners();
  }
}
