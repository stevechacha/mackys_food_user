class SignupResponseModel {
  final String status;
  final String message;
  final Map<String, dynamic> data;

  SignupResponseModel({required this.status, required this.message, required this.data});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
    status: json['status'],
    message: json['message'],
    data: json['data'],
  );
} 