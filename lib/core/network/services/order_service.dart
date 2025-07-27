import 'package:dio/dio.dart';
import '../api_client.dart';
import '../api_exception.dart';
import '../../models/order_models.dart';
import '../api_response.dart';

class OrderService {
  final ApiClient _apiClient;

  OrderService(this._apiClient);

  // Cart Management
  Future<Cart> getCart() async {
    try {
      final response = await _apiClient.get('/orders/cart/');
      return Cart.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<AddToCartResponse> addToCart(AddToCartRequest request) async {
    try {
      final response = await _apiClient.post(
        '/orders/cart/add/',
        data: request.toJson(),
      );
      return AddToCartResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<void> clearCart() async {
    try {
      await _apiClient.delete('/orders/cart/clear/');
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<void> removeFromCart(String itemId) async {
    try {
      await _apiClient.delete('/orders/cart/remove/$itemId/');
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<UpdateCartItemResponse> updateCartItem(
    String itemId,
    UpdateCartItemRequest request,
  ) async {
    try {
      final response = await _apiClient.put(
        '/orders/cart/update/$itemId/',
        data: request.toJson(),
      );
      return UpdateCartItemResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<UpdateCartItemResponse> updateCartItemPartial(
    String itemId,
    UpdateCartItemRequest request,
  ) async {
    try {
      final response = await _apiClient.patch(
        '/orders/cart/update/$itemId/',
        data: request.toJson(),
      );
      return UpdateCartItemResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Checkout
  Future<CheckoutResponse> checkout(CheckoutRequest request) async {
    try {
      final response = await _apiClient.post(
        '/orders/checkout/',
        data: request.toJson(),
      );
      return CheckoutResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Delivery Addresses
  Future<PaginatedResponse<DeliveryAddress>> getDeliveryAddresses({
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await _apiClient.get(
        '/orders/delivery-addresses/',
        queryParameters: queryParams,
      );
      return PaginatedResponse<DeliveryAddress>.fromJson(
        response.data,
        (json) => DeliveryAddress.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<DeliveryAddress> createDeliveryAddress(
    CreateDeliveryAddressRequest request,
  ) async {
    try {
      final response = await _apiClient.post(
        '/orders/delivery-addresses/',
        data: request.toJson(),
      );
      return DeliveryAddress.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<DeliveryAddress> getDeliveryAddress(String id) async {
    try {
      final response = await _apiClient.get('/orders/delivery-addresses/$id/');
      return DeliveryAddress.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<DeliveryAddress> updateDeliveryAddress(
    String id,
    UpdateDeliveryAddressRequest request,
  ) async {
    try {
      final response = await _apiClient.put(
        '/orders/delivery-addresses/$id/',
        data: request.toJson(),
      );
      return DeliveryAddress.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<DeliveryAddress> updateDeliveryAddressPartial(
    String id,
    UpdateDeliveryAddressRequest request,
  ) async {
    try {
      final response = await _apiClient.patch(
        '/orders/delivery-addresses/$id/',
        data: request.toJson(),
      );
      return DeliveryAddress.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<void> deleteDeliveryAddress(String id) async {
    try {
      await _apiClient.delete('/orders/delivery-addresses/$id/');
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Orders
  Future<PaginatedResponse<Order>> getOrders({
    int? limit,
    int? offset,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      final response = await _apiClient.get(
        '/orders/orders/',
        queryParameters: queryParams,
      );
      return PaginatedResponse<Order>.fromJson(
        response.data,
        (json) => Order.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Order> getOrder(String id) async {
    try {
      final response = await _apiClient.get('/orders/orders/$id/');
      return Order.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<OrderTracking> getOrderTracking(String orderId) async {
    try {
      final response = await _apiClient.get('/orders/orders/$orderId/tracking/');
      return OrderTracking.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Payment
  Future<PaymentResponse> processPayment(PaymentRequest request) async {
    try {
      final response = await _apiClient.post(
        '/orders/payment/',
        data: request.toJson(),
      );
      return PaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Tracking
  Future<OrderTracking> getTracking(String trackingId) async {
    try {
      final response = await _apiClient.get('/orders/tracking/$trackingId/');
      return OrderTracking.fromJson(response.data);
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