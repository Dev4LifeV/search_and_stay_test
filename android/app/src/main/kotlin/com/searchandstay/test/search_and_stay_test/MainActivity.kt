package com.searchandstay.test.search_and_stay_test

import com.searchandstay.test.search_and_stay_test.core.methodchannel.HttpDeleteChannel
import com.searchandstay.test.search_and_stay_test.core.methodchannel.core.Channels
import com.searchandstay.test.search_and_stay_test.core.methodchannel.HttpGetChannel
import com.searchandstay.test.search_and_stay_test.core.methodchannel.HttpPostChannel
import com.searchandstay.test.search_and_stay_test.core.methodchannel.HttpPutChannel
import com.searchandstay.test.search_and_stay_test.core.methodchannel.core.MethodResult
import com.searchandstay.test.search_and_stay_test.core.model.HouseRulesData
import com.searchandstay.test.search_and_stay_test.core.model.HouseRulesInfo
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import retrofit2.Retrofit

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        HttpGetChannel(
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                Channels.channelHttpGet
            ), Retrofit.Builder(),
        ).makeRequest {
            args, result, service ->
            val query: String = (args[2] as String?) ?: "1"
            try {
                val response: HouseRulesData = service.get(query)
                result.success(MethodResult(null, response.toMap()).getFlutterValue())
            } catch(err: Exception) {
                result.success(MethodResult(err.localizedMessage, null).getFlutterValue())
            }
        }

        HttpDeleteChannel(
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                Channels.channelHttpDelete
            ), Retrofit.Builder(),
        ).makeRequest {
                _, result, service ->
            try {
                val response: HouseRulesInfo = service.delete()
                result.success(MethodResult(null, response.toMap()).getFlutterValue())
            } catch(err: Exception) {
                result.success(MethodResult(err.localizedMessage, null).getFlutterValue())
            }
        }

        HttpPutChannel(
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                Channels.channelHttpPut
            ), Retrofit.Builder(),
        ).makeRequest {
                args, result, service ->
            @Suppress("UNCHECKED_CAST")
            try {
                val arg: HashMap<String, Any?> = args[2] as HashMap<String, Any?>
                val response: HouseRulesInfo = service.put(arg)
                result.success(MethodResult(null, response.toMap()).getFlutterValue())
            } catch(err: Exception) {
                result.success(MethodResult(err.localizedMessage, null).getFlutterValue())
            }
        }

        HttpPostChannel(
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                Channels.channelHttpPost
            ), Retrofit.Builder(),
        ).makeRequest {
                args, result, service ->
            @Suppress("UNCHECKED_CAST")
            val arg: HashMap<String, Any?> = args[2] as HashMap<String, Any?>
            try {
                val response: HouseRulesInfo = service.post(arg)
                result.success(MethodResult(null, response.toMap()).getFlutterValue())
            } catch(err: Exception) {
                result.success(MethodResult(err.localizedMessage, null).getFlutterValue())
            }
        }

    }
}
