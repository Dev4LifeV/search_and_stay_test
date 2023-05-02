import 'dart:async';

import 'package:search_and_stay_test/core/interface/controller.dart';
import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/usecase/usecase_post_rule.dart';

class ControllerPostRule with Controller<Future<HouseRules>> {
  ControllerPostRule(this._usecase);

  final UsecasePostRule _usecase;

  @override
  Future<HouseRules> executeUsecase([dynamic args]) async {
    try {
      return _usecase.call(args);
    } catch (e) {
      rethrow;
    }
  }
}
