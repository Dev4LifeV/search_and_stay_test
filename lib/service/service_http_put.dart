import 'package:search_and_stay_test/core/method_channels/http_channel_put.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

class ServiceHttpPut {
  ServiceHttpPut(this._channel);

  final HttpChannelPut _channel;

  Future<MethodResult> put(String url, String token, {dynamic args}) async {
    try {
      return _channel.put(
        url,
        token: token,
        args: args[2],
      );
    } catch (e) {
      rethrow;
    }
  }
}
