import 'package:firebase_auth/firebase_auth.dart';
import 'package:search_and_stay_test/core/interface/controller.dart';
import 'package:search_and_stay_test/usecase/usecase_auth.dart';

class ControllerAuth with Controller<Future<User?>> {
  ControllerAuth(this._usecase);

  final UsecaseAuth _usecase;

  @override
  Future<User?> executeUsecase([dynamic args]) async {
    try {
      return _usecase.call();
    } catch (e) {
      rethrow;
    }
  }
}
