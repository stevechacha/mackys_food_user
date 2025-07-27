import 'package:dio/dio.dart';
import '../api_client.dart';
import '../api_exception.dart';
import '../../models/auth_models.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  // Chef Signup
  Future<SignupResponse> chefSignup(ChefSignupRequest request) async {
    try {
      final response = await _apiClient.post('/auth/chef/signup/', data: request.toJson());
      return SignupResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Customer Signup
  Future<SignupResponse> customerSignup(CustomerSignupRequest request) async {
    try {
      final response = await _apiClient.post('/auth/customer/signup/', data: request.toJson());
      return SignupResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Send Email OTP for Profile Completion
  Future<SendEmailOtpResponse> sendEmailOtp(SendEmailOtpRequest request) async {
    try {
      final response = await _apiClient.post('/auth/customer/signup/complete-profile/send-email-otp/', data: request.toJson());
      return SendEmailOtpResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Send Email OTP (General)
  Future<SendEmailOtpResponse> sendEmailOtpGeneral(SendEmailOtpRequest request) async {
    try {
      final response = await _apiClient.post('/auth/user/send-otp/email/', data: request.toJson());
      return SendEmailOtpResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Send SMS OTP
  Future<SendSmsOtpResponse> sendSmsOtp(SendSmsOtpRequest request) async {
    try {
      final response = await _apiClient.post('/auth/user/send-otp/sms/', data: request.toJson());
      return SendSmsOtpResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Complete Customer Profile
  Future<CompleteProfileResponse> completeCustomerProfile(CompleteProfileRequest request) async {
    try {
      final response = await _apiClient.put('/auth/customer/signup/complete-profile/', data: request.toJson());
      return CompleteProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Verify Phone Number
  Future<VerifyPhoneResponse> verifyPhoneNumber(OtpVerificationRequest request) async {
    try {
      final response = await _apiClient.post('/auth/customer/signup/verify-phone-number/', data: request.toJson());
      return VerifyPhoneResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Verify Customer Phone
  Future<VerifyPhoneResponse> verifyCustomerPhone(OtpVerificationRequest request) async {
    try {
      final response = await _apiClient.post('/auth/customer/signup/verify-phone-number/', data: request.toJson());
      return VerifyPhoneResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Update Customer Address
  Future<UpdateAddressResponse> updateCustomerAddress(UpdateAddressRequest request) async {
    try {
      final response = await _apiClient.put('/auth/customer/signup/complete-profile/update-address/', data: request.toJson());
      return UpdateAddressResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Sign In (General)
  Future<SignInResponse> signInGeneral(SignInRequest request) async {
    try {
      final response = await _apiClient.post('/auth/user/sign-in/', data: request.toJson());
      return SignInResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Sign In (Original)
  Future<LoginResponse> signIn(LoginRequest request) async {
    try {
      final response = await _apiClient.post('/auth/login/', data: request.toJson());
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Refresh Token
  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async {
    try {
      final response = await _apiClient.post('/auth/user/sign-in/refresh-token/', data: request.toJson());
      return RefreshTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Verify Token
  Future<VerifyTokenResponse> verifyToken(VerifyTokenRequest request) async {
    try {
      final response = await _apiClient.post('/auth/user/sign-in/verify-token/', data: request.toJson());
      return VerifyTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Forgot Password
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request) async {
    try {
      final response = await _apiClient.put('/auth/user/forgot-password/', data: request.toJson());
      return ForgotPasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Reset Password
  Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      await _apiClient.post('/auth/reset-password/', data: request.toJson());
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Verify Token Validity
  Future<VerifyTokenResponse> verifyTokenValidity(String token, {String? email, String? phoneNumber}) async {
    try {
      final queryParams = <String, String>{};
      if (email != null) queryParams['email'] = email;
      if (phoneNumber != null) queryParams['phone_number'] = phoneNumber;
      
      final response = await _apiClient.get('/auth/user/otp/$token/verify-token-validity/', queryParameters: queryParams);
      return VerifyTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Complete Chef Profile - Personal Info
  Future<void> completeChefProfilePersonalInfo(Map<String, dynamic> data) async {
    try {
      await _apiClient.put('/auth/chef/signup/complete-profile/personal-info/', data: data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Complete Chef Profile - Email OTP
  Future<void> completeChefProfileEmailOtp(Map<String, dynamic> data) async {
    try {
      await _apiClient.post('/auth/chef/signup/complete-profile/email-otp/', data: data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Complete Chef Profile - Address
  Future<void> completeChefProfileAddress(Map<String, dynamic> data) async {
    try {
      await _apiClient.put('/auth/chef/signup/complete-profile/address/', data: data);
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