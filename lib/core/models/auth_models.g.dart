// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChefSignupRequest _$ChefSignupRequestFromJson(Map<String, dynamic> json) =>
    ChefSignupRequest(
      phoneNumber: json['phone_number'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$ChefSignupRequestToJson(ChefSignupRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'password': instance.password,
    };

CustomerSignupRequest _$CustomerSignupRequestFromJson(
  Map<String, dynamic> json,
) => CustomerSignupRequest(
  phoneNumber: json['phone_number'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$CustomerSignupRequestToJson(
  CustomerSignupRequest instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'password': instance.password,
};

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : SignupData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SignupData _$SignupDataFromJson(Map<String, dynamic> json) =>
    SignupData(phoneNumber: json['phone_number'] as String);

Map<String, dynamic> _$SignupDataToJson(SignupData instance) =>
    <String, dynamic>{'phone_number': instance.phoneNumber};

CompleteProfileRequest _$CompleteProfileRequestFromJson(
  Map<String, dynamic> json,
) => CompleteProfileRequest(
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  birthDate: json['birth_date'] as String,
  otpCode: json['otp_code'] as String,
);

Map<String, dynamic> _$CompleteProfileRequestToJson(
  CompleteProfileRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'birth_date': instance.birthDate,
  'otp_code': instance.otpCode,
};

CompleteProfileResponse _$CompleteProfileResponseFromJson(
  Map<String, dynamic> json,
) => CompleteProfileResponse(
  id: json['id'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  birthDate: json['birth_date'] as String,
  msg: json['msg'] as String,
);

Map<String, dynamic> _$CompleteProfileResponseToJson(
  CompleteProfileResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'birth_date': instance.birthDate,
  'msg': instance.msg,
};

SendEmailOtpRequest _$SendEmailOtpRequestFromJson(Map<String, dynamic> json) =>
    SendEmailOtpRequest(email: json['email'] as String);

Map<String, dynamic> _$SendEmailOtpRequestToJson(
  SendEmailOtpRequest instance,
) => <String, dynamic>{'email': instance.email};

SendEmailOtpResponse _$SendEmailOtpResponseFromJson(
  Map<String, dynamic> json,
) => SendEmailOtpResponse(
  email: json['email'] as String,
  msg: json['msg'] as String,
);

Map<String, dynamic> _$SendEmailOtpResponseToJson(
  SendEmailOtpResponse instance,
) => <String, dynamic>{'email': instance.email, 'msg': instance.msg};

SendSmsOtpRequest _$SendSmsOtpRequestFromJson(Map<String, dynamic> json) =>
    SendSmsOtpRequest(phoneNumber: json['phone_number'] as String);

Map<String, dynamic> _$SendSmsOtpRequestToJson(SendSmsOtpRequest instance) =>
    <String, dynamic>{'phone_number': instance.phoneNumber};

SendSmsOtpResponse _$SendSmsOtpResponseFromJson(Map<String, dynamic> json) =>
    SendSmsOtpResponse(
      phoneNumber: json['phone_number'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$SendSmsOtpResponseToJson(SendSmsOtpResponse instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'msg': instance.msg,
    };

UpdateAddressRequest _$UpdateAddressRequestFromJson(
  Map<String, dynamic> json,
) => UpdateAddressRequest(
  address: json['address'] as String,
  longitude: json['longitude'] as String,
  latitude: json['latitude'] as String,
);

Map<String, dynamic> _$UpdateAddressRequestToJson(
  UpdateAddressRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

UpdateAddressResponse _$UpdateAddressResponseFromJson(
  Map<String, dynamic> json,
) => UpdateAddressResponse(
  id: json['id'] as String,
  address: json['address'] as String,
  longitude: json['longitude'] as String,
  latitude: json['latitude'] as String,
  msg: json['msg'] as String,
);

Map<String, dynamic> _$UpdateAddressResponseToJson(
  UpdateAddressResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'address': instance.address,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'msg': instance.msg,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: (json['id'] as num).toInt(),
  phoneNumber: json['phone_number'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  userType: json['user_type'] as String,
  isActive: json['is_active'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'id': instance.id,
  'phone_number': instance.phoneNumber,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'user_type': instance.userType,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
};

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  phoneNumber: json['phone_number'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'user': instance.user,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
};

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(
      identifier: json['identifier'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
    };

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse();

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{};

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) =>
    RefreshTokenRequest(refresh: json['refresh'] as String);

Map<String, dynamic> _$RefreshTokenRequestToJson(
  RefreshTokenRequest instance,
) => <String, dynamic>{'refresh': instance.refresh};

RefreshTokenResponse _$RefreshTokenResponseFromJson(
  Map<String, dynamic> json,
) => RefreshTokenResponse(access: json['access'] as String);

Map<String, dynamic> _$RefreshTokenResponseToJson(
  RefreshTokenResponse instance,
) => <String, dynamic>{'access': instance.access};

VerifyTokenRequest _$VerifyTokenRequestFromJson(Map<String, dynamic> json) =>
    VerifyTokenRequest(token: json['token'] as String);

Map<String, dynamic> _$VerifyTokenRequestToJson(VerifyTokenRequest instance) =>
    <String, dynamic>{'token': instance.token};

OtpRequest _$OtpRequestFromJson(Map<String, dynamic> json) =>
    OtpRequest(phoneNumber: json['phone_number'] as String);

Map<String, dynamic> _$OtpRequestToJson(OtpRequest instance) =>
    <String, dynamic>{'phone_number': instance.phoneNumber};

OtpVerificationRequest _$OtpVerificationRequestFromJson(
  Map<String, dynamic> json,
) => OtpVerificationRequest(
  phoneNumber: json['phone_number'] as String,
  otpCode: json['otp_code'] as String,
);

Map<String, dynamic> _$OtpVerificationRequestToJson(
  OtpVerificationRequest instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'otp_code': instance.otpCode,
};

OtpResponse _$OtpResponseFromJson(Map<String, dynamic> json) => OtpResponse(
  status: json['status'] as String,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : OtpData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OtpResponseToJson(OtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

OtpData _$OtpDataFromJson(Map<String, dynamic> json) => OtpData(
  phoneNumber: json['phone_number'] as String,
  token: json['token'] as String?,
);

Map<String, dynamic> _$OtpDataToJson(OtpData instance) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'token': instance.token,
};

VerifyPhoneResponse _$VerifyPhoneResponseFromJson(Map<String, dynamic> json) =>
    VerifyPhoneResponse(
      phoneNumber: json['phone_number'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$VerifyPhoneResponseToJson(
  VerifyPhoneResponse instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'msg': instance.msg,
};

VerifyTokenResponse _$VerifyTokenResponseFromJson(Map<String, dynamic> json) =>
    VerifyTokenResponse(
      token: json['token'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$VerifyTokenResponseToJson(
  VerifyTokenResponse instance,
) => <String, dynamic>{'token': instance.token, 'msg': instance.msg};

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordRequest(
  phoneNumber: json['phone_number'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$ForgotPasswordRequestToJson(
  ForgotPasswordRequest instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'email': instance.email,
  'password': instance.password,
  'token': instance.token,
};

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordResponse(
  phoneNumber: json['phone_number'] as String,
  email: json['email'] as String,
  msg: json['msg'] as String,
);

Map<String, dynamic> _$ForgotPasswordResponseToJson(
  ForgotPasswordResponse instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'email': instance.email,
  'msg': instance.msg,
};

ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => ResetPasswordRequest(
  token: json['token'] as String,
  newPassword: json['new_password'] as String,
  confirmPassword: json['confirm_password'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  ResetPasswordRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'new_password': instance.newPassword,
  'confirm_password': instance.confirmPassword,
};
