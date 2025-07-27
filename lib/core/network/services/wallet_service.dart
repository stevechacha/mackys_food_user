import 'package:dio/dio.dart';
import '../api_client.dart';
import '../api_exception.dart';
import '../api_response.dart';
import '../../models/wallet_models.dart';

class WalletService {
  final ApiClient _apiClient;

  WalletService(this._apiClient);

  // Get Bank List with Pagination
  Future<PaginatedResponse<BankInfo>> getBankList({int? limit, int? offset}) async {
    try {
      final queryParams = <String, String>{};
      if (limit != null) queryParams['limit'] = limit.toString();
      if (offset != null) queryParams['offset'] = offset.toString();

      final response = await _apiClient.get('/wallet/bank-list/', queryParameters: queryParams);
      return PaginatedResponse<BankInfo>.fromJson(
        response.data,
        (json) => BankInfo.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Fund Wallet
  Future<Map<String, String>> fundWallet(FundWalletRequest request) async {
    try {
      final response = await _apiClient.post('/wallet/fund-wallet/', data: request.toJson());
      return Map<String, String>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Verify Payment
  Future<void> verifyPayment(String reference) async {
    try {
      await _apiClient.get('/wallet/payment-verify/', queryParameters: {'reference': reference});
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Get Wallet Balance
  Future<WalletBalance> getWalletBalance() async {
    try {
      final response = await _apiClient.get('/wallet/balance/');
      return WalletBalance.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Get Wallet Transactions
  Future<PaginatedResponse<WalletTransaction>> getWalletTransactions({int? limit, int? offset}) async {
    try {
      final queryParams = <String, String>{};
      if (limit != null) queryParams['limit'] = limit.toString();
      if (offset != null) queryParams['offset'] = offset.toString();

      final response = await _apiClient.get('/wallet/transactions/', queryParameters: queryParams);
      return PaginatedResponse<WalletTransaction>.fromJson(
        response.data,
        (json) => WalletTransaction.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Withdraw Funds
  Future<WalletTransaction> withdrawFunds(WithdrawRequest request) async {
    try {
      final response = await _apiClient.post('/wallet/withdraw/', data: request.toJson());
      return WalletTransaction.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Add Bank Account
  Future<BankInfo> addBankAccount(AddBankAccountRequest request) async {
    try {
      final response = await _apiClient.post('/wallet/bank-accounts/', data: request.toJson());
      return BankInfo.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Get Bank Accounts
  Future<List<BankInfo>> getBankAccounts() async {
    try {
      final response = await _apiClient.get('/wallet/bank-accounts/');
      return (response.data as List)
          .map((json) => BankInfo.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Delete Bank Account
  Future<void> deleteBankAccount(String accountId) async {
    try {
      await _apiClient.delete('/wallet/bank-accounts/$accountId/');
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