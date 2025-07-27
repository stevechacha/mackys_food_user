import 'package:json_annotation/json_annotation.dart';

part 'profile_models.g.dart';

@JsonSerializable()
class CustomerProfile {
  final String id;
  @JsonKey(name: 'user_type')
  final String userType;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String address;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  @JsonKey(name: 'date_joined')
  final DateTime dateJoined;
  final String longitude;
  final String latitude;
  @JsonKey(name: 'has_completed_kyc')
  final bool hasCompletedKyc;

  CustomerProfile({
    required this.id,
    required this.userType,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.birthDate,
    required this.dateJoined,
    required this.longitude,
    required this.latitude,
    required this.hasCompletedKyc,
  });

  factory CustomerProfile.fromJson(Map<String, dynamic> json) =>
      _$CustomerProfileFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerProfileToJson(this);
}

@JsonSerializable()
class UpdateCustomerProfileRequest {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? address;
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  final String? longitude;
  final String? latitude;

  UpdateCustomerProfileRequest({
    this.firstName,
    this.lastName,
    this.address,
    this.birthDate,
    this.longitude,
    this.latitude,
  });

  factory UpdateCustomerProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerProfileRequestToJson(this);
}

@JsonSerializable()
class ChefProfile {
  final String id;
  @JsonKey(name: 'user_type')
  final String userType;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String address;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  @JsonKey(name: 'date_joined')
  final DateTime dateJoined;
  final String longitude;
  final String latitude;
  @JsonKey(name: 'has_completed_kyc')
  final bool hasCompletedKyc;
  @JsonKey(name: 'kitchen_name')
  final String? kitchenName;
  @JsonKey(name: 'kitchen_description')
  final String? kitchenDescription;
  @JsonKey(name: 'special_services')
  final List<String>? specialServices;

  ChefProfile({
    required this.id,
    required this.userType,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.birthDate,
    required this.dateJoined,
    required this.longitude,
    required this.latitude,
    required this.hasCompletedKyc,
    this.kitchenName,
    this.kitchenDescription,
    this.specialServices,
  });

  factory ChefProfile.fromJson(Map<String, dynamic> json) =>
      _$ChefProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ChefProfileToJson(this);
}

@JsonSerializable()
class UpdateChefProfileRequest {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? address;
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  final String? longitude;
  final String? latitude;
  @JsonKey(name: 'kitchen_name')
  final String? kitchenName;
  @JsonKey(name: 'kitchen_description')
  final String? kitchenDescription;
  @JsonKey(name: 'special_services')
  final List<String>? specialServices;

  UpdateChefProfileRequest({
    this.firstName,
    this.lastName,
    this.address,
    this.birthDate,
    this.longitude,
    this.latitude,
    this.kitchenName,
    this.kitchenDescription,
    this.specialServices,
  });

  factory UpdateChefProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateChefProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateChefProfileRequestToJson(this);
}

@JsonSerializable()
class PublicChefProfile {
  final String id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'kitchen_name')
  final String? kitchenName;
  @JsonKey(name: 'kitchen_description')
  final String? kitchenDescription;
  final String address;
  final String longitude;
  final String latitude;
  @JsonKey(name: 'special_services')
  final List<String>? specialServices;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(name: 'total_reviews')
  final int? totalReviews;

  PublicChefProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.kitchenName,
    this.kitchenDescription,
    required this.address,
    required this.longitude,
    required this.latitude,
    this.specialServices,
    this.rating,
    this.totalReviews,
  });

  factory PublicChefProfile.fromJson(Map<String, dynamic> json) =>
      _$PublicChefProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PublicChefProfileToJson(this);
}

@JsonSerializable()
class SpecialService {
  final String id;
  final String name;
  final String description;
  final double? price;
  final bool isActive;

  SpecialService({
    required this.id,
    required this.name,
    required this.description,
    this.price,
    required this.isActive,
  });

  factory SpecialService.fromJson(Map<String, dynamic> json) =>
      _$SpecialServiceFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialServiceToJson(this);
} 