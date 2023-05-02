import 'package:search_and_stay_test/core/interface/usecase.dart';

import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/service/service_http_put.dart';

class UsecasePutRule with Usecase<Future<HouseRules>> {
  UsecasePutRule(this._serviceHttp);

  final ServiceHttpPut _serviceHttp;

  @override
  Future<HouseRules> call([dynamic args]) async {
    try {
      return _serviceHttp
          .put(args[0], args[1], args: args)
          .then((methodResult) => HouseRules.fromJson(methodResult.value));
    } catch (e) {
      rethrow;
    }
  }
}
