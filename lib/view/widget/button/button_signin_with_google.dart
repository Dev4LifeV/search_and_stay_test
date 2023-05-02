import 'package:flutter/material.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';
import 'package:search_and_stay_test/view/style/fonts.dart';

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({Function()? onPressed, Key? key})
      : _onPressed = onPressed,
        super(key: key);

  final Function()? _onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: context.colors.secondary),
        onPressed: _onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/google.png',
              width: 25,
              height: 25,
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              "Sign in with Google",
              style: context.bodyText,
            )
          ],
        ),
      );
}
