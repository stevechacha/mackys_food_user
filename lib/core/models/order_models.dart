import 'package:json_annotation/json_annotation.dart';

part 'order_models.g.dart';

@JsonSerializable()
class CartItem {
  final String id;
  final String food;
  @JsonKey(name: 'food_name')
  final String foodName;
  @JsonKey(name: 'food_price')
  final String foodPrice;
  @JsonKey(name: 'food_image')
  final String? foodImage;
  final double price;
  final int quantity;
  @JsonKey(name: 'total_price')
  final String totalPrice;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  CartItem({
    required this.id,
    required this.food,
    required this.foodName,
    required this.foodPrice,
    this.foodImage,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.createdAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class Cart {
  final String id;
  final String status;
  final List<CartItem> items;
  @JsonKey(name: 'total_items')
  final String totalItems;
  @JsonKey(name: 'total_amount')
  final String totalAmount;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Cart({
    required this.id,
    required this.status,
    required this.items,
    required this.totalItems,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class AddToCartRequest {
  @JsonKey(name: 'food_id')
  final String foodId;
  final int quantity;

  AddToCartRequest({
    required this.foodId,
    required this.quantity,
  });

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}

@JsonSerializable()
class AddToCartResponse {
  @JsonKey(name: 'food_id')
  final String foodId;
  final int quantity;

  AddToCartResponse({
    required this.foodId,
    required this.quantity,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}

@JsonSerializable()
class UpdateCartItemRequest {
  final int quantity;

  UpdateCartItemRequest({
    required this.quantity,
  });

  factory UpdateCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartItemRequestToJson(this);
}

@JsonSerializable()
class UpdateCartItemResponse {
  final int quantity;

  UpdateCartItemResponse({
    required this.quantity,
  });

  factory UpdateCartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartItemResponseToJson(this);
}

@JsonSerializable()
class CheckoutRequest {
  @JsonKey(name: 'payment_mode')
  final String paymentMode;

  CheckoutRequest({
    required this.paymentMode,
  });

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);
}

@JsonSerializable()
class CheckoutResponse {
  @JsonKey(name: 'payment_mode')
  final String paymentMode;

  CheckoutResponse({
    required this.paymentMode,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);
}

@JsonSerializable()
class PaymentDetails {
  final String id;
  @JsonKey(name: 'item_total')
  final int itemTotal;
  final int discount;
  @JsonKey(name: 'delivery_fee')
  final int deliveryFee;
  @JsonKey(name: 'service_fee')
  final int serviceFee;
  final int total;
  @JsonKey(name: 'payment_mode')
  final String paymentMode;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  PaymentDetails({
    required this.id,
    required this.itemTotal,
    required this.discount,
    required this.deliveryFee,
    required this.serviceFee,
    required this.total,
    required this.paymentMode,
    required this.createdAt,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsToJson(this);
}

@JsonSerializable()
class OrderDeliveryAddress {
  final String id;
  final String address;
  final String state;
  final String longitude;
  final String latitude;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  OrderDeliveryAddress({
    required this.id,
    required this.address,
    required this.state,
    required this.longitude,
    required this.latitude,
    required this.createdAt,
  });

  factory OrderDeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$OrderDeliveryAddressFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDeliveryAddressToJson(this);
}

@JsonSerializable()
class Order {
  final String id;
  final String status;
  @JsonKey(name: 'prep_instruction')
  final String? prepInstruction;
  @JsonKey(name: 'contact_phone')
  final String? contactPhone;
  @JsonKey(name: 'payment_details')
  final PaymentDetails paymentDetails;
  @JsonKey(name: 'delivery_address')
  final OrderDeliveryAddress deliveryAddress;
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @JsonKey(name: 'cancelled_at')
  final DateTime? cancelledAt;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.status,
    this.prepInstruction,
    this.contactPhone,
    required this.paymentDetails,
    required this.deliveryAddress,
    this.deliveredAt,
    this.cancelledAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class DeliveryAddress {
  final String id;
  final String address;
  final String state;
  final String longitude;
  final String latitude;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  DeliveryAddress({
    required this.id,
    required this.address,
    required this.state,
    required this.longitude,
    required this.latitude,
    required this.createdAt,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryAddressToJson(this);
}

@JsonSerializable()
class CreateDeliveryAddressRequest {
  final String address;
  final String state;
  final String longitude;
  final String latitude;

  CreateDeliveryAddressRequest({
    required this.address,
    required this.state,
    required this.longitude,
    required this.latitude,
  });

  factory CreateDeliveryAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDeliveryAddressRequestToJson(this);
}

@JsonSerializable()
class UpdateDeliveryAddressRequest {
  final String? address;
  final String? state;
  final String? longitude;
  final String? latitude;

  UpdateDeliveryAddressRequest({
    this.address,
    this.state,
    this.longitude,
    this.latitude,
  });

  factory UpdateDeliveryAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeliveryAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDeliveryAddressRequestToJson(this);
}

@JsonSerializable()
class OrderTracking {
  final String id;
  @JsonKey(name: 'tracking_id')
  final String trackingId;
  final String status;
  @JsonKey(name: 'order_details')
  final Order orderDetails;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  OrderTracking({
    required this.id,
    required this.trackingId,
    required this.status,
    required this.orderDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderTracking.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackingFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTrackingToJson(this);
}

@JsonSerializable()
class PaymentRequest {
  @JsonKey(name: 'checkout_bill_id')
  final String checkoutBillId;
  @JsonKey(name: 'delivery_address_id')
  final String deliveryAddressId;
  @JsonKey(name: 'return_url')
  final String returnUrl;
  @JsonKey(name: 'prep_instruction')
  final String prepInstruction;
  @JsonKey(name: 'contact_phone')
  final String contactPhone;

  PaymentRequest({
    required this.checkoutBillId,
    required this.deliveryAddressId,
    required this.returnUrl,
    required this.prepInstruction,
    required this.contactPhone,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}

@JsonSerializable()
class PaymentResponse {
  @JsonKey(name: 'checkout_bill_id')
  final String checkoutBillId;
  @JsonKey(name: 'delivery_address_id')
  final String deliveryAddressId;
  @JsonKey(name: 'return_url')
  final String returnUrl;
  @JsonKey(name: 'prep_instruction')
  final String prepInstruction;
  @JsonKey(name: 'contact_phone')
  final String contactPhone;

  PaymentResponse({
    required this.checkoutBillId,
    required this.deliveryAddressId,
    required this.returnUrl,
    required this.prepInstruction,
    required this.contactPhone,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
} 