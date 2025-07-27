// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  id: json['id'] as String,
  food: json['food'] as String,
  foodName: json['food_name'] as String,
  foodPrice: json['food_price'] as String,
  foodImage: json['food_image'] as String?,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  totalPrice: json['total_price'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'food': instance.food,
  'food_name': instance.foodName,
  'food_price': instance.foodPrice,
  'food_image': instance.foodImage,
  'price': instance.price,
  'quantity': instance.quantity,
  'total_price': instance.totalPrice,
  'created_at': instance.createdAt.toIso8601String(),
};

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  id: json['id'] as String,
  status: json['status'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalItems: json['total_items'] as String,
  totalAmount: json['total_amount'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'items': instance.items,
  'total_items': instance.totalItems,
  'total_amount': instance.totalAmount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

AddToCartRequest _$AddToCartRequestFromJson(Map<String, dynamic> json) =>
    AddToCartRequest(
      foodId: json['food_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$AddToCartRequestToJson(AddToCartRequest instance) =>
    <String, dynamic>{
      'food_id': instance.foodId,
      'quantity': instance.quantity,
    };

AddToCartResponse _$AddToCartResponseFromJson(Map<String, dynamic> json) =>
    AddToCartResponse(
      foodId: json['food_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$AddToCartResponseToJson(AddToCartResponse instance) =>
    <String, dynamic>{
      'food_id': instance.foodId,
      'quantity': instance.quantity,
    };

UpdateCartItemRequest _$UpdateCartItemRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCartItemRequest(quantity: (json['quantity'] as num).toInt());

Map<String, dynamic> _$UpdateCartItemRequestToJson(
  UpdateCartItemRequest instance,
) => <String, dynamic>{'quantity': instance.quantity};

UpdateCartItemResponse _$UpdateCartItemResponseFromJson(
  Map<String, dynamic> json,
) => UpdateCartItemResponse(quantity: (json['quantity'] as num).toInt());

Map<String, dynamic> _$UpdateCartItemResponseToJson(
  UpdateCartItemResponse instance,
) => <String, dynamic>{'quantity': instance.quantity};

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    CheckoutRequest(paymentMode: json['payment_mode'] as String);

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{'payment_mode': instance.paymentMode};

CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) =>
    CheckoutResponse(paymentMode: json['payment_mode'] as String);

Map<String, dynamic> _$CheckoutResponseToJson(CheckoutResponse instance) =>
    <String, dynamic>{'payment_mode': instance.paymentMode};

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) =>
    PaymentDetails(
      id: json['id'] as String,
      itemTotal: (json['item_total'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      deliveryFee: (json['delivery_fee'] as num).toInt(),
      serviceFee: (json['service_fee'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      paymentMode: json['payment_mode'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PaymentDetailsToJson(PaymentDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_total': instance.itemTotal,
      'discount': instance.discount,
      'delivery_fee': instance.deliveryFee,
      'service_fee': instance.serviceFee,
      'total': instance.total,
      'payment_mode': instance.paymentMode,
      'created_at': instance.createdAt.toIso8601String(),
    };

OrderDeliveryAddress _$OrderDeliveryAddressFromJson(
  Map<String, dynamic> json,
) => OrderDeliveryAddress(
  id: json['id'] as String,
  address: json['address'] as String,
  state: json['state'] as String,
  longitude: json['longitude'] as String,
  latitude: json['latitude'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$OrderDeliveryAddressToJson(
  OrderDeliveryAddress instance,
) => <String, dynamic>{
  'id': instance.id,
  'address': instance.address,
  'state': instance.state,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'created_at': instance.createdAt.toIso8601String(),
};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String,
  status: json['status'] as String,
  prepInstruction: json['prep_instruction'] as String?,
  contactPhone: json['contact_phone'] as String?,
  paymentDetails: PaymentDetails.fromJson(
    json['payment_details'] as Map<String, dynamic>,
  ),
  deliveryAddress: OrderDeliveryAddress.fromJson(
    json['delivery_address'] as Map<String, dynamic>,
  ),
  deliveredAt: json['delivered_at'] == null
      ? null
      : DateTime.parse(json['delivered_at'] as String),
  cancelledAt: json['cancelled_at'] == null
      ? null
      : DateTime.parse(json['cancelled_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'prep_instruction': instance.prepInstruction,
  'contact_phone': instance.contactPhone,
  'payment_details': instance.paymentDetails,
  'delivery_address': instance.deliveryAddress,
  'delivered_at': instance.deliveredAt?.toIso8601String(),
  'cancelled_at': instance.cancelledAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    DeliveryAddress(
      id: json['id'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$DeliveryAddressToJson(DeliveryAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'state': instance.state,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'created_at': instance.createdAt.toIso8601String(),
    };

CreateDeliveryAddressRequest _$CreateDeliveryAddressRequestFromJson(
  Map<String, dynamic> json,
) => CreateDeliveryAddressRequest(
  address: json['address'] as String,
  state: json['state'] as String,
  longitude: json['longitude'] as String,
  latitude: json['latitude'] as String,
);

Map<String, dynamic> _$CreateDeliveryAddressRequestToJson(
  CreateDeliveryAddressRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'state': instance.state,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

UpdateDeliveryAddressRequest _$UpdateDeliveryAddressRequestFromJson(
  Map<String, dynamic> json,
) => UpdateDeliveryAddressRequest(
  address: json['address'] as String?,
  state: json['state'] as String?,
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
);

Map<String, dynamic> _$UpdateDeliveryAddressRequestToJson(
  UpdateDeliveryAddressRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  'state': instance.state,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

OrderTracking _$OrderTrackingFromJson(Map<String, dynamic> json) =>
    OrderTracking(
      id: json['id'] as String,
      trackingId: json['tracking_id'] as String,
      status: json['status'] as String,
      orderDetails: Order.fromJson(
        json['order_details'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrderTrackingToJson(OrderTracking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tracking_id': instance.trackingId,
      'status': instance.status,
      'order_details': instance.orderDetails,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      checkoutBillId: json['checkout_bill_id'] as String,
      deliveryAddressId: json['delivery_address_id'] as String,
      returnUrl: json['return_url'] as String,
      prepInstruction: json['prep_instruction'] as String,
      contactPhone: json['contact_phone'] as String,
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'checkout_bill_id': instance.checkoutBillId,
      'delivery_address_id': instance.deliveryAddressId,
      'return_url': instance.returnUrl,
      'prep_instruction': instance.prepInstruction,
      'contact_phone': instance.contactPhone,
    };

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      checkoutBillId: json['checkout_bill_id'] as String,
      deliveryAddressId: json['delivery_address_id'] as String,
      returnUrl: json['return_url'] as String,
      prepInstruction: json['prep_instruction'] as String,
      contactPhone: json['contact_phone'] as String,
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'checkout_bill_id': instance.checkoutBillId,
      'delivery_address_id': instance.deliveryAddressId,
      'return_url': instance.returnUrl,
      'prep_instruction': instance.prepInstruction,
      'contact_phone': instance.contactPhone,
    };
