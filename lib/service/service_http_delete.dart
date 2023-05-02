import 'package:search_and_stay_test/core/method_channels/http_channel_delete.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

class ServiceHttpDelete {
  ServiceHttpDelete(this._channel);

  final HttpChannelDelete _channel;

  Future<MethodResult> delete(String url, String token, {dynamic args}) async {
    try {
      return _channel.delete(
        url,
        token: token,
        args: args,
      );
    } catch (e) {
      rethrow;
    }
  }
}
