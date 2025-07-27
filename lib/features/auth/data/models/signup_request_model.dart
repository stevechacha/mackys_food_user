class SignupRequestModel {
  final String phoneNumber;
  final String password;

  SignupRequestModel({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() => {
    'phone_number': phoneNumber,
    'password': password,
  };
} 