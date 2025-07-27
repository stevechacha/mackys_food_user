class SignupEntity {
  final String phoneNumber;
  final String? message;
  final String? token;

  SignupEntity({
    required this.phoneNumber,
    this.message,
    this.token,
  });
} 