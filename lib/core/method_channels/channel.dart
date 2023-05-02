import 'package:flutter/services.dart';
import 'package:search_and_stay_test/core/method_channels/method_result.dart';

abstract class Channel {
  const Channel();

  abstract final MethodChannel channel;

  Future<MethodResult> invoke(List<dynamic> args) async {
    try {
      return channel
          .invokeMethod("", args)
          .then(
            (value) => MethodResult(
              value["error"],
              value["value"],
            ),
          )
          .then((result) =>
              result.error != null ? throw Exception(result.error) : result);
    } catch (e) {
      rethrow;
    }
  }
}
