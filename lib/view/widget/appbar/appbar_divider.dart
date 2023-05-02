import 'package:flutter/material.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';

class CustomDivider extends StatelessWidget implements PreferredSizeWidget {
  const CustomDivider({Color? color, double? thickness, super.key})
      : _color = color,
        _thickness = thickness;

  final Color? _color;
  final double? _thickness;

  @override
  Widget build(BuildContext context) => Divider(
        color: _color ?? context.colors.primary,
        height: 0,
        thickness: _thickness ?? 2,
      );

  @override
  Size get preferredSize => const Size(double.infinity, 0);
}
