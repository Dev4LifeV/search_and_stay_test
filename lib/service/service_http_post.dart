import 'package:search_and_stay_test/core/method_channels/http_channel_post.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

class ServiceHttpPost {
  ServiceHttpPost(this._channel);

  final HttpChannelPost _channel;

  Future<MethodResult> post(String url, String token, {dynamic args}) async {
    try {
      return _channel.post(
        url,
        token: token,
        args: args,
      );
    } catch (e) {
      rethrow;
    }
  }
}
