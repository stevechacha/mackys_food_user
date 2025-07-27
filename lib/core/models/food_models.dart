import 'package:json_annotation/json_annotation.dart';

part 'food_models.g.dart';

@JsonSerializable()
class FoodReview {
  final String id;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'display_image')
  final String? displayImage;
  final int rating;
  final String review;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  FoodReview({
    required this.id,
    required this.fullName,
    this.displayImage,
    required this.rating,
    required this.review,
    required this.createdAt,
  });

  factory FoodReview.fromJson(Map<String, dynamic> json) =>
      _$FoodReviewFromJson(json);

  Map<String, dynamic> toJson() => _$FoodReviewToJson(this);
}

@JsonSerializable()
class CreateFoodReviewRequest {
  final int rating;
  final String review;

  CreateFoodReviewRequest({
    required this.rating,
    required this.review,
  });

  factory CreateFoodReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFoodReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFoodReviewRequestToJson(this);
}

@JsonSerializable()
class UpdateFoodReviewRequest {
  final int? rating;
  final String? review;

  UpdateFoodReviewRequest({
    this.rating,
    this.review,
  });

  factory UpdateFoodReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFoodReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFoodReviewRequestToJson(this);
}

@JsonSerializable()
class KitchenAmenity {
  final String id;
  final String name;

  KitchenAmenity({
    required this.id,
    required this.name,
  });

  factory KitchenAmenity.fromJson(Map<String, dynamic> json) =>
      _$KitchenAmenityFromJson(json);

  Map<String, dynamic> toJson() => _$KitchenAmenityToJson(this);
}

@JsonSerializable()
class ChefReview {
  final String id;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'display_image')
  final String? displayImage;
  final int rating;
  final String review;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  ChefReview({
    required this.id,
    required this.fullName,
    this.displayImage,
    required this.rating,
    required this.review,
    required this.createdAt,
  });

  factory ChefReview.fromJson(Map<String, dynamic> json) =>
      _$ChefReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ChefReviewToJson(this);
}

@JsonSerializable()
class Chef {
  final String id;
  @JsonKey(name: 'display_image')
  final String? displayImage;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final bool vetted;
  final bool certified;
  @JsonKey(name: 'years_cooking')
  final int yearsCooking;
  @JsonKey(name: 'school_attended')
  final String? schoolAttended;
  final List<String> services;

  Chef({
    required this.id,
    this.displayImage,
    required this.firstName,
    required this.lastName,
    required this.vetted,
    required this.certified,
    required this.yearsCooking,
    this.schoolAttended,
    required this.services,
  });

  factory Chef.fromJson(Map<String, dynamic> json) =>
      _$ChefFromJson(json);

  Map<String, dynamic> toJson() => _$ChefToJson(this);
}

@JsonSerializable()
class ChefKitchenItem {
  final String id;
  final String name;
  final String type;
  final bool liked;
  final Chef chef;
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  final bool available;

  ChefKitchenItem({
    required this.id,
    required this.name,
    required this.type,
    required this.liked,
    required this.chef,
    this.coverImage,
    required this.available,
  });

  factory ChefKitchenItem.fromJson(Map<String, dynamic> json) =>
      _$ChefKitchenItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChefKitchenItemToJson(this);
}

@JsonSerializable()
class ChefKitchenDashboard {
  final int count;
  final String? next;
  final String? previous;
  final List<ChefKitchenItem> results;

  ChefKitchenDashboard({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ChefKitchenDashboard.fromJson(Map<String, dynamic> json) =>
      _$ChefKitchenDashboardFromJson(json);

  Map<String, dynamic> toJson() => _$ChefKitchenDashboardToJson(this);
}

@JsonSerializable()
class MarketplaceFood {
  final String id;
  final String name;
  @JsonKey(name: 'display_image')
  final String? displayImage;
  final String dietary;
  @JsonKey(name: 'preparation_time_minutes')
  final int preparationTimeMinutes;
  final String price;
  @JsonKey(name: 'old_price')
  final String? oldPrice;
  @JsonKey(name: 'average_rating')
  final double averageRating;

  MarketplaceFood({
    required this.id,
    required this.name,
    this.displayImage,
    required this.dietary,
    required this.preparationTimeMinutes,
    required this.price,
    this.oldPrice,
    required this.averageRating,
  });

  factory MarketplaceFood.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceFoodFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceFoodToJson(this);
}

@JsonSerializable()
class MarketplaceKitchen {
  final String id;
  final bool liked;
  final Chef chef;
  final bool available;
  final List<MarketplaceFood> foods;

  MarketplaceKitchen({
    required this.id,
    required this.liked,
    required this.chef,
    required this.available,
    required this.foods,
  });

  factory MarketplaceKitchen.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceKitchenFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceKitchenToJson(this);
}

@JsonSerializable()
class MarketplaceDashboard {
  final int count;
  final String? next;
  final String? previous;
  final List<MarketplaceKitchen> results;

  MarketplaceDashboard({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory MarketplaceDashboard.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceDashboardFromJson(json);

  Map<String, dynamic> toJson() => _$MarketplaceDashboardToJson(this);
}

@JsonSerializable()
class FoodItem {
  final String id;
  final String name;
  final String description;
  @JsonKey(name: 'display_image')
  final String? displayImage;
  final String dietary;
  @JsonKey(name: 'preparation_time_minutes')
  final int preparationTimeMinutes;
  final String price;
  @JsonKey(name: 'old_price')
  final String? oldPrice;
  @JsonKey(name: 'food_categories')
  final List<String> foodCategories;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    this.displayImage,
    required this.dietary,
    required this.preparationTimeMinutes,
    required this.price,
    this.oldPrice,
    required this.foodCategories,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoodItemToJson(this);
}

@JsonSerializable()
class FoodListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<FoodItem> results;

  FoodListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory FoodListResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodListResponseToJson(this);
}

@JsonSerializable()
class ToggleLikeRequest {
  final bool like;

  ToggleLikeRequest({
    required this.like,
  });

  factory ToggleLikeRequest.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleLikeRequestToJson(this);
}

@JsonSerializable()
class ToggleLikeResponse {
  final String msg;

  ToggleLikeResponse({
    required this.msg,
  });

  factory ToggleLikeResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleLikeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleLikeResponseToJson(this);
}

@JsonSerializable()
class KitchenImageItem {
  final String image;

  KitchenImageItem({
    required this.image,
  });

  factory KitchenImageItem.fromJson(Map<String, dynamic> json) =>
      _$KitchenImageItemFromJson(json);

  Map<String, dynamic> toJson() => _$KitchenImageItemToJson(this);
}

@JsonSerializable()
class KitchenImageGroup {
  final String name;
  final List<KitchenImageItem> images;

  KitchenImageGroup({
    required this.name,
    required this.images,
  });

  factory KitchenImageGroup.fromJson(Map<String, dynamic> json) =>
      _$KitchenImageGroupFromJson(json);

  Map<String, dynamic> toJson() => _$KitchenImageGroupToJson(this);
}

@JsonSerializable()
class KitchenImagesResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<KitchenImageGroup> results;

  KitchenImagesResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory KitchenImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$KitchenImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KitchenImagesResponseToJson(this);
}

@JsonSerializable()
class KitchenImage {
  final String id;
  final String image;
  @JsonKey(name: 'kitchen_id')
  final String kitchenId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  KitchenImage({
    required this.id,
    required this.image,
    required this.kitchenId,
    required this.createdAt,
  });

  factory KitchenImage.fromJson(Map<String, dynamic> json) =>
      _$KitchenImageFromJson(json);

  Map<String, dynamic> toJson() => _$KitchenImageToJson(this);
}

@JsonSerializable()
class Kitchen {
  final String id;
  final String name;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final double rating;
  final int reviewCount;
  final bool isActive;
  @JsonKey(name: 'chef_id')
  final String chefId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Kitchen({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.reviewCount,
    required this.isActive,
    required this.chefId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Kitchen.fromJson(Map<String, dynamic> json) =>
      _$KitchenFromJson(json);

  Map<String, dynamic> toJson() => _$KitchenToJson(this);
} 