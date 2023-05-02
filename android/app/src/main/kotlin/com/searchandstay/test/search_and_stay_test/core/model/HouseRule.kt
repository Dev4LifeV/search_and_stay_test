package com.searchandstay.test.search_and_stay_test.core.model

data class HouseRule(
    val id: Int?,
    val name: String?,
    val active: Int?,
    val order: Int?
) {
    fun toMap(): HashMap<String, Any?> = hashMapOf(
        "id" to id,
        "name" to name,
        "active" to active,
        "order" to order,
    )

    fun toJson(): HashMap<String, HashMap<String, Any?>> = hashMapOf(
        "house_rules" to hashMapOf(
            "name" to name,
            "active" to active,
        )
    )
}
