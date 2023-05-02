package com.searchandstay.test.search_and_stay_test.core.methodchannel

import com.searchandstay.test.search_and_stay_test.core.methodchannel.core.HttpChannel
import io.flutter.plugin.common.MethodChannel
import retrofit2.Retrofit


data class HttpPutChannel(
    override var channel: MethodChannel,
    override val retrofit: Retrofit.Builder,
) :
    HttpChannel