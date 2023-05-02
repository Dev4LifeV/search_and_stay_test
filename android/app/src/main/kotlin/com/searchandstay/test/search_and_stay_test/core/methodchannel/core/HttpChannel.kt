package com.searchandstay.test.search_and_stay_test.core.methodchannel.core
import com.searchandstay.test.search_and_stay_test.core.repository.RepositoryHouseRules
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

interface HttpChannel : FlutterMethodChannel {
    val retrofit: Retrofit.Builder

    fun makeRequest(onResponse: suspend (arg: List<*>, result: MethodChannel.Result, service: RepositoryHouseRules) -> Unit) {
        try {
            super.callMethod { call, result ->

                val args = call.arguments as List<*>
                val url = args[0] as String
                val token = args[1] as String

                val service = retrofit
                    .baseUrl(url)
                    .addConverterFactory(
                        GsonConverterFactory.create()
                    )
                    .client(createOkHttpClient(token))
                    .build()
                    .create(RepositoryHouseRules::class.java)

                CoroutineScope(Dispatchers.IO).launch {
                    withContext(Dispatchers.Main) { onResponse(args, result, service) }
                }
            }
        } catch (e: Exception) {
            super.callMethod { _, result ->
                result.error(e.message.toString(), e.stackTrace.toString(), e.localizedMessage)
            }
        }
    }

    fun createOkHttpClient(token: String): OkHttpClient {
        val okHttpClient = OkHttpClient.Builder()

        okHttpClient.addInterceptor { chain ->
            val originalRequest = chain.request()
            val requestBuilder = originalRequest.newBuilder()
                .header("Authorization", "Bearer $token")
                .method(originalRequest.method(), originalRequest.body())

            chain.proceed(requestBuilder.build())
        }

        return okHttpClient.build()
    }
}