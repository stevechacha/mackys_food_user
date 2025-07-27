import 'package:mackys_partners/features/auth/domain/repositories/auth_repository.dart';
import 'package:mackys_partners/features/auth/domain/entities/signup_entity.dart';
import 'package:mackys_partners/core/network/network_service.dart';
import 'package:mackys_partners/core/models/auth_models.dart';
import 'package:mackys_partners/core/network/api_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkService _networkService;

  AuthRepositoryImpl(this._networkService);

  @override
  Future<SignupEntity> signup(String phoneNumber, String password, String confirmPassword, String firstName, String lastName, String email, String userType) async {
    try {
      SignupResponse response;
      
      if (userType == 'chef') {
        final request = ChefSignupRequest(
          phoneNumber: phoneNumber,
          password: password,
        );
        response = await _networkService.auth.chefSignup(request);
      } else {
        final request = CustomerSignupRequest(
          phoneNumber: phoneNumber,
          password: password,
        );
        response = await _networkService.auth.customerSignup(request);
      }

      return SignupEntity(
        phoneNumber: response.data?.phoneNumber ?? phoneNumber,
        message: response.message,
        token: null, // Token will be received after OTP verification
      );
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<SignupEntity> verifyPhoneNumber(String phoneNumber, String otp, String userType) async {
    try {
      final request = OtpVerificationRequest(
        phoneNumber: phoneNumber,
        otpCode: otp,
      );

      VerifyPhoneResponse response;
      if (userType == 'chef') {
        response = await _networkService.auth.verifyPhoneNumber(request);
      } else {
        response = await _networkService.auth.verifyCustomerPhone(request);
      }

      return SignupEntity(
        phoneNumber: response.phoneNumber,
        message: response.msg,
        token: null,
      );
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<SignupEntity> login(String phoneNumber, String password) async {
    try {
      final request = LoginRequest(
        phoneNumber: phoneNumber,
        password: password,
      );

      final response = await _networkService.auth.signIn(request);

      return SignupEntity(
        phoneNumber: response.data?.user.phoneNumber ?? phoneNumber,
        message: response.message,
        token: response.data?.accessToken,
      );
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<SignupEntity> forgotPassword(String phoneNumber, String email, String password, String token) async {
    try {
      final request = ForgotPasswordRequest(
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        token: token,
      );

      final response = await _networkService.auth.forgotPassword(request);

      return SignupEntity(
        phoneNumber: response.phoneNumber,
        message: response.msg,
        token: null,
      );
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> resetPassword(String token, String newPassword, String confirmPassword) async {
    try {
      final request = ResetPasswordRequest(
        token: token,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      await _networkService.auth.resetPassword(request);
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<SignupEntity> verifyTokenValidity(String token, {String? email, String? phoneNumber}) async {
    try {
      final response = await _networkService.auth.verifyTokenValidity(token, email: email, phoneNumber: phoneNumber);

      return SignupEntity(
        phoneNumber: phoneNumber ?? '',
        message: response.msg,
        token: response.token,
      );
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> sendEmailOtp(String email) async {
    try {
      final request = SendEmailOtpRequest(email: email);
      await _networkService.auth.sendEmailOtp(request);
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<SignupEntity> completeCustomerProfile(String email, String firstName, String lastName, String birthDate, String otpCode) async {
    try {
      final request = CompleteProfileRequest(
        email: email,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        otpCode: otpCode,
      );

      final response = await _networkService.auth.completeCustomerProfile(request);

      return SignupEntity(
        phoneNumber: response.phoneNumber,
        message: response.msg,
        token: null,
      );
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> completeChefProfilePersonalInfo(Map<String, dynamic> data) async {
    try {
      await _networkService.auth.completeChefProfilePersonalInfo(data);
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> completeChefProfileEmailOtp(Map<String, dynamic> data) async {
    try {
      await _networkService.auth.completeChefProfileEmailOtp(data);
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> completeChefProfileAddress(Map<String, dynamic> data) async {
    try {
      await _networkService.auth.completeChefProfileAddress(data);
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> completeCustomerProfileAddress(Map<String, dynamic> data) async {
    try {
      final request = UpdateAddressRequest(
        address: data['address'],
        longitude: data['longitude'],
        latitude: data['latitude'],
      );
      await _networkService.auth.updateCustomerAddress(request);
    } on ApiException catch (e) {
      throw Exception(e.message);
    } on NetworkException catch (e) {
      throw Exception('Network error: ${e.message}');
    } on ServerException catch (e) {
      throw Exception('Server error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
} 