import 'package:json_annotation/json_annotation.dart';

part 'wallet_models.g.dart';

@JsonSerializable()
class BankInfo {
  final String name;
  final String code;

  BankInfo({
    required this.name,
    required this.code,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) =>
      _$BankInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BankInfoToJson(this);
}

@JsonSerializable()
class FundWalletRequest {
  final double amount;
  @JsonKey(name: 'return_url')
  final String returnUrl;

  FundWalletRequest({
    required this.amount,
    required this.returnUrl,
  });

  factory FundWalletRequest.fromJson(Map<String, dynamic> json) =>
      _$FundWalletRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FundWalletRequestToJson(this);
}

@JsonSerializable()
class AddBankAccountRequest {
  @JsonKey(name: 'bank_code')
  final String bankCode;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  @JsonKey(name: 'account_name')
  final String accountName;

  AddBankAccountRequest({
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
  });

  factory AddBankAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AddBankAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddBankAccountRequestToJson(this);
}

@JsonSerializable()
class WalletBalance {
  final double balance;
  final String currency;
  @JsonKey(name: 'last_updated')
  final DateTime lastUpdated;

  WalletBalance({
    required this.balance,
    required this.currency,
    required this.lastUpdated,
  });

  factory WalletBalance.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$WalletBalanceToJson(this);
}

@JsonSerializable()
class WalletTransaction {
  final String id;
  final String type;
  final double amount;
  final String currency;
  final String status;
  final String? reference;
  final String? description;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  WalletTransaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.currency,
    required this.status,
    this.reference,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$WalletTransactionToJson(this);
}

@JsonSerializable()
class WithdrawRequest {
  final double amount;
  @JsonKey(name: 'bank_account_id')
  final String bankAccountId;
  final String? description;

  WithdrawRequest({
    required this.amount,
    required this.bankAccountId,
    this.description,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawRequestToJson(this);
} 