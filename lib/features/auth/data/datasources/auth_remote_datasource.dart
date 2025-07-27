import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

class AuthRemoteDatasource {
  final http.Client client;

  AuthRemoteDatasource(this.client);

  Future<SignupResponseModel> signup(SignupRequestModel request) async {
    final response = await client.post(
      Uri.parse('https://macky-customer-app-backend.onrender.com/api/v1/auth/customer/signup/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );
    if (response.statusCode == 201) {
      return SignupResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to signup');
    }
  }
} 