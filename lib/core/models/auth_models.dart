import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

// Signup Models
@JsonSerializable()
class ChefSignupRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String password;

  ChefSignupRequest({
    required this.phoneNumber,
    required this.password,
  });

  factory ChefSignupRequest.fromJson(Map<String, dynamic> json) =>
      _$ChefSignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChefSignupRequestToJson(this);
}

@JsonSerializable()
class CustomerSignupRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String password;

  CustomerSignupRequest({
    required this.phoneNumber,
    required this.password,
  });

  factory CustomerSignupRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerSignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerSignupRequestToJson(this);
}

@JsonSerializable()
class SignupResponse {
  final String status;
  final String message;
  final SignupData? data;

  SignupResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class SignupData {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  SignupData({
    required this.phoneNumber,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignupDataToJson(this);
}

// Profile Completion Models
@JsonSerializable()
class CompleteProfileRequest {
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  @JsonKey(name: 'otp_code')
  final String otpCode;

  CompleteProfileRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.otpCode,
  });

  factory CompleteProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteProfileRequestToJson(this);
}

@JsonSerializable()
class CompleteProfileResponse {
  final String id;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final String msg;

  CompleteProfileResponse({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.msg,
  });

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteProfileResponseToJson(this);
}

@JsonSerializable()
class SendEmailOtpRequest {
  final String email;

  SendEmailOtpRequest({
    required this.email,
  });

  factory SendEmailOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailOtpRequestToJson(this);
}

@JsonSerializable()
class SendEmailOtpResponse {
  final String email;
  final String msg;

  SendEmailOtpResponse({
    required this.email,
    required this.msg,
  });

  factory SendEmailOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailOtpResponseToJson(this);
}

@JsonSerializable()
class SendSmsOtpRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  SendSmsOtpRequest({
    required this.phoneNumber,
  });

  factory SendSmsOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendSmsOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsOtpRequestToJson(this);
}

@JsonSerializable()
class SendSmsOtpResponse {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String msg;

  SendSmsOtpResponse({
    required this.phoneNumber,
    required this.msg,
  });

  factory SendSmsOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendSmsOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsOtpResponseToJson(this);
}

@JsonSerializable()
class UpdateAddressRequest {
  final String address;
  final String longitude;
  final String latitude;

  UpdateAddressRequest({
    required this.address,
    required this.longitude,
    required this.latitude,
  });

  factory UpdateAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAddressRequestToJson(this);
}

@JsonSerializable()
class UpdateAddressResponse {
  final String id;
  final String address;
  final String longitude;
  final String latitude;
  final String msg;

  UpdateAddressResponse({
    required this.id,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.msg,
  });

  factory UpdateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAddressResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final int id;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'user_type')
  final String userType;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  UserData({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userType,
    required this.isActive,
    required this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

// Login Models
@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String password;

  LoginRequest({
    required this.phoneNumber,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final String status;
  final String message;
  final LoginData? data;

  LoginResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final UserData user;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  LoginData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

// General Sign In Models
@JsonSerializable()
class SignInRequest {
  final String identifier;
  final String password;

  SignInRequest({
    required this.identifier,
    required this.password,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

@JsonSerializable()
class SignInResponse {
  // Empty response for 200 OK
  SignInResponse();

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

// Refresh Token Models
@JsonSerializable()
class RefreshTokenRequest {
  final String refresh;

  RefreshTokenRequest({
    required this.refresh,
  });

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}

@JsonSerializable()
class RefreshTokenResponse {
  final String access;

  RefreshTokenResponse({
    required this.access,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}

// Verify Token Models
@JsonSerializable()
class VerifyTokenRequest {
  final String token;

  VerifyTokenRequest({
    required this.token,
  });

  factory VerifyTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyTokenRequestToJson(this);
}

// OTP Models
@JsonSerializable()
class OtpRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  OtpRequest({
    required this.phoneNumber,
  });

  factory OtpRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);
}

@JsonSerializable()
class OtpVerificationRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'otp_code')
  final String otpCode;

  OtpVerificationRequest({
    required this.phoneNumber,
    required this.otpCode,
  });

  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerificationRequestToJson(this);
}

@JsonSerializable()
class OtpResponse {
  final String status;
  final String message;
  final OtpData? data;

  OtpResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}

@JsonSerializable()
class OtpData {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String? token;

  OtpData({
    required this.phoneNumber,
    this.token,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);

  Map<String, dynamic> toJson() => _$OtpDataToJson(this);
}

@JsonSerializable()
class VerifyPhoneResponse {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String msg;

  VerifyPhoneResponse({
    required this.phoneNumber,
    required this.msg,
  });

  factory VerifyPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneResponseToJson(this);
}

@JsonSerializable()
class VerifyTokenResponse {
  final String token;
  final String msg;

  VerifyTokenResponse({
    required this.token,
    required this.msg,
  });

  factory VerifyTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyTokenResponseToJson(this);
}

// Password Reset Models
@JsonSerializable()
class ForgotPasswordRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String email;
  final String password;
  final String token;

  ForgotPasswordRequest({
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.token,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String email;
  final String msg;

  ForgotPasswordResponse({
    required this.phoneNumber,
    required this.email,
    required this.msg,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

@JsonSerializable()
class ResetPasswordRequest {
  final String token;
  @JsonKey(name: 'new_password')
  final String newPassword;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;

  ResetPasswordRequest({
    required this.token,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
} 