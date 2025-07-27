import 'package:dio/dio.dart';
import '../api_client.dart';
import '../api_exception.dart';
import '../../models/food_models.dart';
import '../api_response.dart';

class FoodService {
  final ApiClient _apiClient;

  FoodService(this._apiClient);

  // Food Reviews
  Future<PaginatedResponse<FoodReview>> getFoodReviews(
    String foodId, {
    int? limit,
    int? offset,
    String? user,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;
      if (user != null) queryParams['user'] = user;

      final response = await _apiClient.get(
        '/foods/$foodId/reviews/',
        queryParameters: queryParams,
      );
      return PaginatedResponse<FoodReview>.fromJson(
        response.data,
        (json) => FoodReview.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<FoodReview> createFoodReview(
    String foodId,
    CreateFoodReviewRequest request,
  ) async {
    try {
      final response = await _apiClient.post(
        '/foods/$foodId/reviews/',
        data: request.toJson(),
      );
      return FoodReview.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<FoodReview> getFoodReview(String foodId, String reviewId) async {
    try {
      final response = await _apiClient.get('/foods/$foodId/reviews/$reviewId/');
      return FoodReview.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<FoodReview> updateFoodReview(
    String foodId,
    String reviewId,
    UpdateFoodReviewRequest request,
  ) async {
    try {
      final response = await _apiClient.patch(
        '/foods/$foodId/reviews/$reviewId/',
        data: request.toJson(),
      );
      return FoodReview.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Kitchen Amenities
  Future<PaginatedResponse<KitchenAmenity>> getKitchenAmenities(
    String kitchenId, {
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await _apiClient.get(
        '/foods/amenities-list/$kitchenId/',
        queryParameters: queryParams,
      );
      return PaginatedResponse<KitchenAmenity>.fromJson(
        response.data,
        (json) => KitchenAmenity.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Chef Reviews
  Future<PaginatedResponse<ChefReview>> getChefReviews(
    String kitchenId, {
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await _apiClient.get(
        '/foods/chef-reviews/$kitchenId/',
        queryParameters: queryParams,
      );
      return PaginatedResponse<ChefReview>.fromJson(
        response.data,
        (json) => ChefReview.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Dashboard
  Future<ChefKitchenDashboard> getChefKitchenDashboard({
    bool? breakfast,
    String? cuisine,
    bool? dessertSnacks,
    String? dietary,
    bool? dinner,
    bool? drinks,
    int? limit,
    bool? lunch,
    int? offset,
    String? preparationType,
    double? priceMax,
    double? priceMin,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (breakfast != null) queryParams['breakfast'] = breakfast;
      if (cuisine != null) queryParams['cuisine'] = cuisine;
      if (dessertSnacks != null) queryParams['dessert_snacks'] = dessertSnacks;
      if (dietary != null) queryParams['dietary'] = dietary;
      if (dinner != null) queryParams['dinner'] = dinner;
      if (drinks != null) queryParams['drinks'] = drinks;
      if (limit != null) queryParams['limit'] = limit;
      if (lunch != null) queryParams['lunch'] = lunch;
      if (offset != null) queryParams['offset'] = offset;
      if (preparationType != null) queryParams['preparation_type'] = preparationType;
      if (priceMax != null) queryParams['price_max'] = priceMax;
      if (priceMin != null) queryParams['price_min'] = priceMin;
      if (search != null) queryParams['search'] = search;

      final response = await _apiClient.get(
        '/foods/dashboard/chef-kitchen/',
        queryParameters: queryParams,
      );
      return ChefKitchenDashboard.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<MarketplaceDashboard> getMarketplaceDashboard({
    bool? breakfast,
    String? cuisine,
    bool? dessertSnacks,
    String? dietary,
    bool? dinner,
    bool? drinks,
    int? limit,
    bool? lunch,
    int? offset,
    String? preparationType,
    double? priceMax,
    double? priceMin,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (breakfast != null) queryParams['breakfast'] = breakfast;
      if (cuisine != null) queryParams['cuisine'] = cuisine;
      if (dessertSnacks != null) queryParams['dessert_snacks'] = dessertSnacks;
      if (dietary != null) queryParams['dietary'] = dietary;
      if (dinner != null) queryParams['dinner'] = dinner;
      if (drinks != null) queryParams['drinks'] = drinks;
      if (limit != null) queryParams['limit'] = limit;
      if (lunch != null) queryParams['lunch'] = lunch;
      if (offset != null) queryParams['offset'] = offset;
      if (preparationType != null) queryParams['preparation_type'] = preparationType;
      if (priceMax != null) queryParams['price_max'] = priceMax;
      if (priceMin != null) queryParams['price_min'] = priceMin;
      if (search != null) queryParams['search'] = search;

      final response = await _apiClient.get(
        '/foods/dashboard/marketplace/',
        queryParameters: queryParams,
      );
      return MarketplaceDashboard.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Food List
  Future<FoodListResponse> getFoodList(
    String kitchenId, {
    bool? breakfast,
    String? cuisine,
    bool? dessertSnacks,
    String? dietary,
    bool? dinner,
    bool? drinks,
    int? limit,
    bool? lunch,
    int? offset,
    String? preparationType,
    double? priceMax,
    double? priceMin,
    String? search,
    String? topFoodId,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (breakfast != null) queryParams['breakfast'] = breakfast;
      if (cuisine != null) queryParams['cuisine'] = cuisine;
      if (dessertSnacks != null) queryParams['dessert_snacks'] = dessertSnacks;
      if (dietary != null) queryParams['dietary'] = dietary;
      if (dinner != null) queryParams['dinner'] = dinner;
      if (drinks != null) queryParams['drinks'] = drinks;
      if (limit != null) queryParams['limit'] = limit;
      if (lunch != null) queryParams['lunch'] = lunch;
      if (offset != null) queryParams['offset'] = offset;
      if (preparationType != null) queryParams['preparation_type'] = preparationType;
      if (priceMax != null) queryParams['price_max'] = priceMax;
      if (priceMin != null) queryParams['price_min'] = priceMin;
      if (search != null) queryParams['search'] = search;
      if (topFoodId != null) queryParams['top_food_id'] = topFoodId;

      final response = await _apiClient.get(
        '/foods/food-list/$kitchenId/',
        queryParameters: queryParams,
      );
      return FoodListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Toggle Food Like
  Future<ToggleLikeResponse> toggleFoodLike(
    String foodId,
    ToggleLikeRequest request,
  ) async {
    try {
      final response = await _apiClient.put(
        '/foods/food/toggle-like/$foodId/',
        data: request.toJson(),
      );
      return ToggleLikeResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Kitchen Images
  Future<KitchenImagesResponse> getKitchenImages(
    String kitchenId, {
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await _apiClient.get(
        '/foods/kitchen-images-list/$kitchenId/',
        queryParameters: queryParams,
      );
      return KitchenImagesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    if (e.response?.statusCode == 401) {
      return UnauthorizedException(message: 'Unauthorized access');
    } else if (e.response?.statusCode == 500) {
      return ServerException(message: 'Internal server error', statusCode: 500);
    } else if (e.type == DioExceptionType.connectionTimeout ||
               e.type == DioExceptionType.receiveTimeout ||
               e.type == DioExceptionType.sendTimeout) {
      return NetworkException(message: 'Connection timeout');
    } else if (e.type == DioExceptionType.connectionError) {
      return NetworkException(message: 'No internet connection');
    } else {
      final message = e.response?.data?['message'] ?? e.message ?? 'Unknown error occurred';
      return ApiException(message: message);
    }
  }
} 