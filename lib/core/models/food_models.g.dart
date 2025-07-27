// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodReview _$FoodReviewFromJson(Map<String, dynamic> json) => FoodReview(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  displayImage: json['display_image'] as String?,
  rating: (json['rating'] as num).toInt(),
  review: json['review'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$FoodReviewToJson(FoodReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'display_image': instance.displayImage,
      'rating': instance.rating,
      'review': instance.review,
      'created_at': instance.createdAt.toIso8601String(),
    };

CreateFoodReviewRequest _$CreateFoodReviewRequestFromJson(
  Map<String, dynamic> json,
) => CreateFoodReviewRequest(
  rating: (json['rating'] as num).toInt(),
  review: json['review'] as String,
);

Map<String, dynamic> _$CreateFoodReviewRequestToJson(
  CreateFoodReviewRequest instance,
) => <String, dynamic>{'rating': instance.rating, 'review': instance.review};

UpdateFoodReviewRequest _$UpdateFoodReviewRequestFromJson(
  Map<String, dynamic> json,
) => UpdateFoodReviewRequest(
  rating: (json['rating'] as num?)?.toInt(),
  review: json['review'] as String?,
);

Map<String, dynamic> _$UpdateFoodReviewRequestToJson(
  UpdateFoodReviewRequest instance,
) => <String, dynamic>{'rating': instance.rating, 'review': instance.review};

KitchenAmenity _$KitchenAmenityFromJson(Map<String, dynamic> json) =>
    KitchenAmenity(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$KitchenAmenityToJson(KitchenAmenity instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

ChefReview _$ChefReviewFromJson(Map<String, dynamic> json) => ChefReview(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  displayImage: json['display_image'] as String?,
  rating: (json['rating'] as num).toInt(),
  review: json['review'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ChefReviewToJson(ChefReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'display_image': instance.displayImage,
      'rating': instance.rating,
      'review': instance.review,
      'created_at': instance.createdAt.toIso8601String(),
    };

Chef _$ChefFromJson(Map<String, dynamic> json) => Chef(
  id: json['id'] as String,
  displayImage: json['display_image'] as String?,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  vetted: json['vetted'] as bool,
  certified: json['certified'] as bool,
  yearsCooking: (json['years_cooking'] as num).toInt(),
  schoolAttended: json['school_attended'] as String?,
  services: (json['services'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ChefToJson(Chef instance) => <String, dynamic>{
  'id': instance.id,
  'display_image': instance.displayImage,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'vetted': instance.vetted,
  'certified': instance.certified,
  'years_cooking': instance.yearsCooking,
  'school_attended': instance.schoolAttended,
  'services': instance.services,
};

ChefKitchenItem _$ChefKitchenItemFromJson(Map<String, dynamic> json) =>
    ChefKitchenItem(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      liked: json['liked'] as bool,
      chef: Chef.fromJson(json['chef'] as Map<String, dynamic>),
      coverImage: json['cover_image'] as String?,
      available: json['available'] as bool,
    );

Map<String, dynamic> _$ChefKitchenItemToJson(ChefKitchenItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'liked': instance.liked,
      'chef': instance.chef,
      'cover_image': instance.coverImage,
      'available': instance.available,
    };

ChefKitchenDashboard _$ChefKitchenDashboardFromJson(
  Map<String, dynamic> json,
) => ChefKitchenDashboard(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => ChefKitchenItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ChefKitchenDashboardToJson(
  ChefKitchenDashboard instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

MarketplaceFood _$MarketplaceFoodFromJson(Map<String, dynamic> json) =>
    MarketplaceFood(
      id: json['id'] as String,
      name: json['name'] as String,
      displayImage: json['display_image'] as String?,
      dietary: json['dietary'] as String,
      preparationTimeMinutes: (json['preparation_time_minutes'] as num).toInt(),
      price: json['price'] as String,
      oldPrice: json['old_price'] as String?,
      averageRating: (json['average_rating'] as num).toDouble(),
    );

Map<String, dynamic> _$MarketplaceFoodToJson(MarketplaceFood instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_image': instance.displayImage,
      'dietary': instance.dietary,
      'preparation_time_minutes': instance.preparationTimeMinutes,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'average_rating': instance.averageRating,
    };

MarketplaceKitchen _$MarketplaceKitchenFromJson(Map<String, dynamic> json) =>
    MarketplaceKitchen(
      id: json['id'] as String,
      liked: json['liked'] as bool,
      chef: Chef.fromJson(json['chef'] as Map<String, dynamic>),
      available: json['available'] as bool,
      foods: (json['foods'] as List<dynamic>)
          .map((e) => MarketplaceFood.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketplaceKitchenToJson(MarketplaceKitchen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'liked': instance.liked,
      'chef': instance.chef,
      'available': instance.available,
      'foods': instance.foods,
    };

MarketplaceDashboard _$MarketplaceDashboardFromJson(
  Map<String, dynamic> json,
) => MarketplaceDashboard(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => MarketplaceKitchen.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MarketplaceDashboardToJson(
  MarketplaceDashboard instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) => FoodItem(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  displayImage: json['display_image'] as String?,
  dietary: json['dietary'] as String,
  preparationTimeMinutes: (json['preparation_time_minutes'] as num).toInt(),
  price: json['price'] as String,
  oldPrice: json['old_price'] as String?,
  foodCategories: (json['food_categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$FoodItemToJson(FoodItem instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'display_image': instance.displayImage,
  'dietary': instance.dietary,
  'preparation_time_minutes': instance.preparationTimeMinutes,
  'price': instance.price,
  'old_price': instance.oldPrice,
  'food_categories': instance.foodCategories,
};

FoodListResponse _$FoodListResponseFromJson(Map<String, dynamic> json) =>
    FoodListResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodListResponseToJson(FoodListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

ToggleLikeRequest _$ToggleLikeRequestFromJson(Map<String, dynamic> json) =>
    ToggleLikeRequest(like: json['like'] as bool);

Map<String, dynamic> _$ToggleLikeRequestToJson(ToggleLikeRequest instance) =>
    <String, dynamic>{'like': instance.like};

ToggleLikeResponse _$ToggleLikeResponseFromJson(Map<String, dynamic> json) =>
    ToggleLikeResponse(msg: json['msg'] as String);

Map<String, dynamic> _$ToggleLikeResponseToJson(ToggleLikeResponse instance) =>
    <String, dynamic>{'msg': instance.msg};

KitchenImageItem _$KitchenImageItemFromJson(Map<String, dynamic> json) =>
    KitchenImageItem(image: json['image'] as String);

Map<String, dynamic> _$KitchenImageItemToJson(KitchenImageItem instance) =>
    <String, dynamic>{'image': instance.image};

KitchenImageGroup _$KitchenImageGroupFromJson(Map<String, dynamic> json) =>
    KitchenImageGroup(
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => KitchenImageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KitchenImageGroupToJson(KitchenImageGroup instance) =>
    <String, dynamic>{'name': instance.name, 'images': instance.images};

KitchenImagesResponse _$KitchenImagesResponseFromJson(
  Map<String, dynamic> json,
) => KitchenImagesResponse(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => KitchenImageGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$KitchenImagesResponseToJson(
  KitchenImagesResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

KitchenImage _$KitchenImageFromJson(Map<String, dynamic> json) => KitchenImage(
  id: json['id'] as String,
  image: json['image'] as String,
  kitchenId: json['kitchen_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$KitchenImageToJson(KitchenImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'kitchen_id': instance.kitchenId,
      'created_at': instance.createdAt.toIso8601String(),
    };

Kitchen _$KitchenFromJson(Map<String, dynamic> json) => Kitchen(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
  isActive: json['isActive'] as bool,
  chefId: json['chef_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$KitchenToJson(Kitchen instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'isActive': instance.isActive,
  'chef_id': instance.chefId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
