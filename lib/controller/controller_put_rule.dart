import 'dart:async';

import 'package:search_and_stay_test/core/interface/controller.dart';
import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/usecase/usecase_put_rule.dart';

class ControllerPutRule with Controller<Future<HouseRules>> {
  ControllerPutRule(this._usecase);

  final UsecasePutRule _usecase;

  @override
  Future<HouseRules> executeUsecase([dynamic args]) async {
    try {
      return _usecase.call(args);
    } catch (e) {
      rethrow;
    }
  }
}
