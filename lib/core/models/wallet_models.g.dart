// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfo _$BankInfoFromJson(Map<String, dynamic> json) =>
    BankInfo(name: json['name'] as String, code: json['code'] as String);

Map<String, dynamic> _$BankInfoToJson(BankInfo instance) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
};

FundWalletRequest _$FundWalletRequestFromJson(Map<String, dynamic> json) =>
    FundWalletRequest(
      amount: (json['amount'] as num).toDouble(),
      returnUrl: json['return_url'] as String,
    );

Map<String, dynamic> _$FundWalletRequestToJson(FundWalletRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'return_url': instance.returnUrl,
    };

AddBankAccountRequest _$AddBankAccountRequestFromJson(
  Map<String, dynamic> json,
) => AddBankAccountRequest(
  bankCode: json['bank_code'] as String,
  accountNumber: json['account_number'] as String,
  accountName: json['account_name'] as String,
);

Map<String, dynamic> _$AddBankAccountRequestToJson(
  AddBankAccountRequest instance,
) => <String, dynamic>{
  'bank_code': instance.bankCode,
  'account_number': instance.accountNumber,
  'account_name': instance.accountName,
};

WalletBalance _$WalletBalanceFromJson(Map<String, dynamic> json) =>
    WalletBalance(
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$WalletBalanceToJson(WalletBalance instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) =>
    WalletTransaction(
      id: json['id'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
      reference: json['reference'] as String?,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WalletTransactionToJson(WalletTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
      'reference': instance.reference,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

WithdrawRequest _$WithdrawRequestFromJson(Map<String, dynamic> json) =>
    WithdrawRequest(
      amount: (json['amount'] as num).toDouble(),
      bankAccountId: json['bank_account_id'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$WithdrawRequestToJson(WithdrawRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'bank_account_id': instance.bankAccountId,
      'description': instance.description,
    };
