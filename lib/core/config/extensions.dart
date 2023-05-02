// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';

extension SchemeStyle on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

extension LoadingState<T extends StatefulWidget> on State<T> {
  static var _loadingState = false;

  bool get loading => _loadingState;

  bool get nowLoading {
    setState(() => _loadingState = true);
    return _loadingState;
  }

  bool get stopLoading {
    setState(() => _loadingState = false);
    return _loadingState;
  }
}
