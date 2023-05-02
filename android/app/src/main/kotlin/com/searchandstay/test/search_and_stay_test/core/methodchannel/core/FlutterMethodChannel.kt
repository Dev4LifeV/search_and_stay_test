package com.searchandstay.test.search_and_stay_test.core.methodchannel.core

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

interface FlutterMethodChannel {

    var channel: MethodChannel

    fun callMethod(handler: (MethodCall, MethodChannel.Result) -> Unit) = this.channel.setMethodCallHandler(MethodChannel.MethodCallHandler(handler))

}