import 'package:flutter/material.dart';
import 'package:search_and_stay_test/app.dart';
import 'package:search_and_stay_test/init.dart';

void main() => init().then(
      (_) => runApp(
        const App(),
      ),
    );
