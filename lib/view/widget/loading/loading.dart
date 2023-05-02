import 'package:flutter/material.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(context.colors.secondary),
      );
}
