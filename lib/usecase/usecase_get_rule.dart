import 'package:search_and_stay_test/core/config/injector.dart';
import 'package:search_and_stay_test/core/interface/usecase.dart';
import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/service/service_http_get.dart';

class UsecaseGetRule with Usecase<Future<HouseRules>> {
  UsecaseGetRule(this._serviceHttp);

  final ServiceHttpGet _serviceHttp;

  @override
  Future<HouseRules> call([dynamic args]) async {
    try {
      return _serviceHttp.get(args[0], args[1], args: args).then(
            (methodResult) => Injector.shared.update<HouseRules, HouseRules>(
              () => HouseRules.fromJson(methodResult.value),
            ),
          );
    } catch (e) {
      rethrow;
    }
  }
}
