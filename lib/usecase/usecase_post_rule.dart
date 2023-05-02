import 'package:search_and_stay_test/core/interface/usecase.dart';
import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/service/service_http_post.dart';

class UsecasePostRule with Usecase<Future<HouseRules>> {
  UsecasePostRule(this._serviceHttp);

  final ServiceHttpPost _serviceHttp;

  @override
  Future<HouseRules> call([dynamic args]) async {
    try {
      return _serviceHttp
          .post(args[0], args[1], args: args[2])
          .then((methodResult) => HouseRules.fromJson(methodResult.value));
    } catch (e) {
      rethrow;
    }
  }
}
