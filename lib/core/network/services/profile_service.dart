import 'package:dio/dio.dart';
import '../api_client.dart';
import '../api_exception.dart';
import '../../models/profile_models.dart';

class ProfileService {
  final ApiClient _apiClient;

  ProfileService(this._apiClient);

  // Customer Profile
  Future<CustomerProfile> getCustomerProfile() async {
    try {
      final response = await _apiClient.get('/profiles/customer/profile/');
      return CustomerProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<CustomerProfile> updateCustomerProfile(UpdateCustomerProfileRequest request) async {
    try {
      final response = await _apiClient.patch('/profiles/customer/profile/', data: request.toJson());
      return CustomerProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<void> deleteCustomerProfile() async {
    try {
      await _apiClient.delete('/profiles/customer/profile/');
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Chef Profile
  Future<ChefProfile> getChefProfile() async {
    try {
      final response = await _apiClient.get('/profiles/chef/profile/');
      return ChefProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<ChefProfile> updateChefProfile(UpdateChefProfileRequest request) async {
    try {
      final response = await _apiClient.patch('/profiles/chef/profile/', data: request.toJson());
      return ChefProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<void> deleteChefProfile() async {
    try {
      await _apiClient.delete('/profiles/chef/profile/');
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Public Chef Profile
  Future<PublicChefProfile> getPublicChefProfile(String chefId) async {
    try {
      final response = await _apiClient.get('/profiles/chef/public-profile/$chefId/');
      return PublicChefProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Chef Special Service List
  Future<List<SpecialService>> getChefSpecialServiceList() async {
    try {
      final response = await _apiClient.get('/profiles/chef/special-service-list/');
      return (response.data as List)
          .map((json) => SpecialService.fromJson(json))
          .toList();
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