import 'package:flutter/material.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';

extension Fonts on BuildContext {
  TextStyle? get _titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get _bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get _headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle get title => TextStyle(
        fontSize: (_titleMedium?.fontSize ?? 20) + 8,
        height: _titleMedium?.height,
        wordSpacing: _titleMedium?.wordSpacing,
        textBaseline: _titleMedium?.textBaseline,
        overflow: _titleMedium?.overflow,
        letterSpacing: _titleMedium?.letterSpacing,
        fontVariations: _titleMedium?.fontVariations,
        fontWeight: FontWeight.w300,
        color: colors.primary,
        fontFeatures: _titleMedium?.fontFeatures,
      );

  TextStyle get bodyText => TextStyle(
        fontSize: _bodyLarge?.fontSize,
        height: _bodyLarge?.height,
        wordSpacing: _bodyLarge?.wordSpacing,
        textBaseline: _bodyLarge?.textBaseline,
        overflow: _bodyLarge?.overflow,
        letterSpacing: _bodyLarge?.letterSpacing,
        fontVariations: _bodyLarge?.fontVariations,
        fontWeight: FontWeight.w700,
        color: colors.primary,
        fontFeatures: _bodyLarge?.fontFeatures,
      );

  TextStyle get headlineLarge => TextStyle(
        fontSize: _headlineLarge?.fontSize,
        height: _headlineLarge?.height,
        wordSpacing: _headlineLarge?.wordSpacing,
        textBaseline: _headlineLarge?.textBaseline,
        overflow: _headlineLarge?.overflow,
        letterSpacing: _headlineLarge?.letterSpacing,
        fontVariations: _headlineLarge?.fontVariations,
        fontWeight: _headlineLarge?.fontWeight,
        color: colors.primary,
        fontFeatures: _headlineLarge?.fontFeatures,
      );
}
