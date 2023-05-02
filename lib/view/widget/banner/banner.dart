import 'package:flutter/material.dart';
import 'package:search_and_stay_test/view/style/fonts.dart';

class CustomBanner extends MaterialBanner {
  CustomBanner(
      {required BuildContext context,
      required String message,
      Color? backgroundColor,
      Key? key})
      : super(
            backgroundColor: backgroundColor,
            content: Text(
              message,
              style: context.bodyText,
            ),
            actions: [
              TextButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).clearMaterialBanners(),
                child: Text(
                  "OK",
                  style: context.bodyText,
                ),
              )
            ],
            key: key);
}
