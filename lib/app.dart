import 'package:flutter/material.dart';
import 'package:search_and_stay_test/view/style/colors.dart';
import 'package:search_and_stay_test/view/view_login.dart';

class App extends MaterialApp {
  const App({super.key});

  @override
  Widget? get home => ViewLogin();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            background: AppColors.backgroundColor,
            onBackground: Colors.white,
            primary: AppColors.primary,
            onPrimary: AppColors.onPrimary,
            secondary: AppColors.secondary,
            onSecondary: AppColors.onSecondary,
            surface: AppColors.onPrimary,
            onSurface: Colors.black,
            error: Colors.red,
            onError: Colors.redAccent),
      );
}
