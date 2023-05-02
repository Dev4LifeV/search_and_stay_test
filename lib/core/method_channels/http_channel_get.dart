import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_and_stay_test/core/method_channels/channel.dart';
import 'package:search_and_stay_test/core/method_channels/channels.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

class HttpChannelGet extends Channel {
  @override
  final MethodChannel channel = const MethodChannel(channelHttpGet);

  Future<MethodResult> get(String url, {String? token, dynamic args}) async {
    try {
      return invoke(
        [
          url,
          token,
          args[2],
        ],
      );
    } catch (e, s) {
      print(e);
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }
}
