import 'package:flutter/material.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';
import 'package:search_and_stay_test/view/style/fonts.dart';
import 'package:search_and_stay_test/view/widget/appbar/appbar_divider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    String? title,
    super.key,
  }) : _title = title;

  final String? _title;

  static const double toolbarHeight = kToolbarHeight + 44;

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: const Size(double.infinity, CustomAppBar.toolbarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: toolbarHeight,
              color: context.colors.onPrimary,
              alignment: Alignment.center,
              child: _title != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        _title ?? "",
                        style: context.title,
                      ),
                    )
                  : Container(),
            ),
            const CustomDivider()
          ],
        ),
      );

  @override
  Size get preferredSize =>
      const Size(double.infinity, CustomAppBar.toolbarHeight);
}
