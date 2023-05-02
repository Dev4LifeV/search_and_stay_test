import 'dart:async';
import 'package:search_and_stay_test/core/interface/controller.dart';
import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/usecase/usecase_delete_rule.dart';

class ControllerDeleteRule with Controller<Future<HouseRules>> {
  ControllerDeleteRule(this._usecase);

  final UsecaseDeleteRule _usecase;

  @override
  Future<HouseRules> executeUsecase([dynamic args]) async {
    try {
      return _usecase.call(args);
    } catch (e) {
      rethrow;
    }
  }
}
