package com.searchandstay.test.search_and_stay_test.core.model

data class HouseRulesInfo(
    val success: Boolean?,
    val message: String?,
) {
    fun toMap(): HashMap<String, Any?> = hashMapOf(
        "success" to this.success,
        "message" to this.message,
    )
}

data class HouseRulesData(
    val success: Boolean?,
    val data: Data?,
    val message: String?,
) {
    fun toMap(): HashMap<String, Any?> = hashMapOf(
        "success" to this.success,
        "message" to this.message,
        "data" to hashMapOf(
            "entities" to (data?.entities as List<*>).map { rule -> (rule as HouseRule).toMap() },
            "pagination" to data.pagination?.toMap()
        ),
    )
}

data class Pagination (
    val total: Int?,
    val count: Int?,
    val per_page: Int?,
    val current_page: Int?,
    val total_pages: Int?,
    val links: Links?,
        ) {
    fun toMap(): HashMap<String, Any?> = hashMapOf(
        "total" to this.total,
        "count" to this.count,
        "per_page" to this.per_page,
        "current_page" to this.current_page,
        "total_pages" to this.total_pages,
        "links" to this.links?.toMap()
    )
}

data class Links (
    val next: String?,
    val prev: String?,
        ) {
    fun toMap(): HashMap<String, Any?> = hashMapOf(
        "next" to this.next,
        "prev" to this.prev,
    )
}


data class Data (
    val entities: List<HouseRule?>?,
    val pagination: Pagination?,
        )