import 'dart:async';
import 'package:search_and_stay_test/core/interface/controller.dart';
import 'package:search_and_stay_test/core/model/house_rule.dart';
import 'package:search_and_stay_test/usecase/usecase_get_rule.dart';

class ControllerGetRule with Controller<Future<List<HouseRule?>>> {
  ControllerGetRule(this._usecase);

  final UsecaseGetRule _usecase;

  @override
  Future<List<HouseRule?>> executeUsecase([dynamic args]) async {
    try {
      return _usecase.call(args).then((value) => value.data.entities.rules);
    } catch (e) {
      rethrow;
    }
  }
}
