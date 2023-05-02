package com.searchandstay.test.search_and_stay_test.core.methodchannel.core

data class MethodResult(val error: Any?, val value: Any?) {
    companion object fun getFlutterValue(): HashMap<String, Any?> = hashMapOf(
        "error" to this.error,
        "value" to this.value,
    )
}
