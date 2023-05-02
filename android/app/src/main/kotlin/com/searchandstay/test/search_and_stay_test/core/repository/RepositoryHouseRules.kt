package com.searchandstay.test.search_and_stay_test.core.repository
import com.searchandstay.test.search_and_stay_test.core.model.HouseRulesData
import com.searchandstay.test.search_and_stay_test.core.model.HouseRulesInfo
import retrofit2.http.Body
import retrofit2.http.DELETE
import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.PUT
import retrofit2.http.Query

interface RepositoryHouseRules {
    @GET(".")
    suspend fun get(@Query("page") page: String): HouseRulesData

    @POST(".")
    suspend fun post(@Body body: HashMap<String, Any?>): HouseRulesInfo

    @PUT(".")
    suspend fun put(@Body body: HashMap<String, Any?>): HouseRulesInfo

    @DELETE(".")
    suspend fun delete(): HouseRulesInfo
}