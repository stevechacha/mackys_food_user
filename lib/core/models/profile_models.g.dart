// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProfile _$CustomerProfileFromJson(Map<String, dynamic> json) =>
    CustomerProfile(
      id: json['id'] as String,
      userType: json['user_type'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      address: json['address'] as String,
      birthDate: json['birth_date'] as String,
      dateJoined: DateTime.parse(json['date_joined'] as String),
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      hasCompletedKyc: json['has_completed_kyc'] as bool,
    );

Map<String, dynamic> _$CustomerProfileToJson(CustomerProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_type': instance.userType,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address': instance.address,
      'birth_date': instance.birthDate,
      'date_joined': instance.dateJoined.toIso8601String(),
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'has_completed_kyc': instance.hasCompletedKyc,
    };

UpdateCustomerProfileRequest _$UpdateCustomerProfileRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCustomerProfileRequest(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  address: json['address'] as String?,
  birthDate: json['birth_date'] as String?,
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
);

Map<String, dynamic> _$UpdateCustomerProfileRequestToJson(
  UpdateCustomerProfileRequest instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'address': instance.address,
  'birth_date': instance.birthDate,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

ChefProfile _$ChefProfileFromJson(Map<String, dynamic> json) => ChefProfile(
  id: json['id'] as String,
  userType: json['user_type'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  address: json['address'] as String,
  birthDate: json['birth_date'] as String,
  dateJoined: DateTime.parse(json['date_joined'] as String),
  longitude: json['longitude'] as String,
  latitude: json['latitude'] as String,
  hasCompletedKyc: json['has_completed_kyc'] as bool,
  kitchenName: json['kitchen_name'] as String?,
  kitchenDescription: json['kitchen_description'] as String?,
  specialServices: (json['special_services'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ChefProfileToJson(ChefProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_type': instance.userType,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address': instance.address,
      'birth_date': instance.birthDate,
      'date_joined': instance.dateJoined.toIso8601String(),
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'has_completed_kyc': instance.hasCompletedKyc,
      'kitchen_name': instance.kitchenName,
      'kitchen_description': instance.kitchenDescription,
      'special_services': instance.specialServices,
    };

UpdateChefProfileRequest _$UpdateChefProfileRequestFromJson(
  Map<String, dynamic> json,
) => UpdateChefProfileRequest(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  address: json['address'] as String?,
  birthDate: json['birth_date'] as String?,
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
  kitchenName: json['kitchen_name'] as String?,
  kitchenDescription: json['kitchen_description'] as String?,
  specialServices: (json['special_services'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UpdateChefProfileRequestToJson(
  UpdateChefProfileRequest instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'address': instance.address,
  'birth_date': instance.birthDate,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'kitchen_name': instance.kitchenName,
  'kitchen_description': instance.kitchenDescription,
  'special_services': instance.specialServices,
};

PublicChefProfile _$PublicChefProfileFromJson(Map<String, dynamic> json) =>
    PublicChefProfile(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      kitchenName: json['kitchen_name'] as String?,
      kitchenDescription: json['kitchen_description'] as String?,
      address: json['address'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      specialServices: (json['special_services'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      totalReviews: (json['total_reviews'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PublicChefProfileToJson(PublicChefProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'kitchen_name': instance.kitchenName,
      'kitchen_description': instance.kitchenDescription,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'special_services': instance.specialServices,
      'rating': instance.rating,
      'total_reviews': instance.totalReviews,
    };

SpecialService _$SpecialServiceFromJson(Map<String, dynamic> json) =>
    SpecialService(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$SpecialServiceToJson(SpecialService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'isActive': instance.isActive,
    };
