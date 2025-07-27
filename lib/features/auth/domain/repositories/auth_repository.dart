import '../entities/signup_entity.dart';

abstract class AuthRepository {
  Future<SignupEntity> signup(String phoneNumber, String password, String confirmPassword, String firstName, String lastName, String email, String userType);
  Future<SignupEntity> verifyPhoneNumber(String phoneNumber, String otp, String userType);
  Future<SignupEntity> login(String phoneNumber, String password);
  Future<SignupEntity> forgotPassword(String phoneNumber, String email, String password, String token);
  Future<void> resetPassword(String token, String newPassword, String confirmPassword);
  Future<SignupEntity> verifyTokenValidity(String token, {String? email, String? phoneNumber});
  
  // Profile Completion Methods
  Future<void> sendEmailOtp(String email);
  Future<SignupEntity> completeCustomerProfile(String email, String firstName, String lastName, String birthDate, String otpCode);
  Future<void> completeChefProfilePersonalInfo(Map<String, dynamic> data);
  Future<void> completeChefProfileEmailOtp(Map<String, dynamic> data);
  Future<void> completeChefProfileAddress(Map<String, dynamic> data);
  Future<void> completeCustomerProfileAddress(Map<String, dynamic> data);
} 