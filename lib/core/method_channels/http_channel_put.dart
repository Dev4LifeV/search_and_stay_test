import 'package:flutter/services.dart';
import 'package:search_and_stay_test/core/method_channels/channel.dart';
import 'package:search_and_stay_test/core/method_channels/channels.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

class HttpChannelPut extends Channel {
  @override
  final MethodChannel channel = const MethodChannel(channelHttpPut);

  Future<MethodResult> put(String url, {String? token, dynamic args}) async {
    try {
      return invoke(
        [
          url,
          token,
          args,
        ],
      );
    } catch (e) {
      rethrow;
    }
  }
}
