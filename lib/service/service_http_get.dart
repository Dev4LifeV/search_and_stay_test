import 'package:search_and_stay_test/core/method_channels/http_channel_get.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

class ServiceHttpGet {
  ServiceHttpGet(this._channel);

  final HttpChannelGet _channel;

  Future<MethodResult> get(String url, String token, {dynamic args}) async {
    try {
      return _channel.get(
        url,
        token: token,
        args: args,
      );
    } catch (e) {
      rethrow;
    }
  }
}
