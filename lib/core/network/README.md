# Network Layer Documentation

This document describes the clean architecture network layer implementation for the Macky's Partners app.

## Architecture Overview

The network layer follows clean architecture principles with the following structure:

```
lib/core/network/
├── api_client.dart          # Base HTTP client with interceptors
├── api_exception.dart       # Custom exception classes
├── api_response.dart        # Generic response wrappers
├── network_service.dart     # Main service aggregator
└── services/
    ├── auth_service.dart    # Authentication endpoints
    ├── food_service.dart    # Food and kitchen endpoints
    ├── order_service.dart   # Order and cart endpoints
    ├── profile_service.dart # User profile endpoints
    └── wallet_service.dart # Wallet and payment endpoints
```

## Key Features

### 1. **ApiClient** - Base HTTP Client
- Uses Dio for HTTP requests
- Automatic token management
- Request/response interceptors
- Error handling
- File upload support

### 2. **Exception Handling**
- `ApiException` - General API errors
- `NetworkException` - Network connectivity issues
- `UnauthorizedException` - 401 errors
- `ServerException` - 500+ errors

### 3. **Service Layer**
Each service handles a specific domain:
- **AuthService** - Authentication, signup, login, OTP
- **FoodService** - Kitchens, foods, reviews, search
- **OrderService** - Cart, orders, delivery addresses
- **ProfileService** - User profiles, settings
- **WalletService** - Wallet operations, payments

## Usage Examples

### 1. Authentication

```dart
import 'package:mackys_partners/core/network/network_service.dart';
import 'package:mackys_partners/core/models/auth_models.dart';

// Sign up a chef
final chefSignupRequest = ChefSignupRequest(
  phoneNumber: '+1234567890',
  password: 'password123',
  confirmPassword: 'password123',
  firstName: 'John',
  lastName: 'Doe',
  email: 'john@example.com',
);

try {
  final response = await networkService.auth.chefSignup(chefSignupRequest);
  print('Signup successful: ${response.message}');
} catch (e) {
  print('Signup failed: $e');
}

// Login
final loginRequest = LoginRequest(
  phoneNumber: '+1234567890',
  password: 'password123',
);

try {
  final response = await networkService.auth.signIn(loginRequest);
  print('Login successful: ${response.accessToken}');
} catch (e) {
  print('Login failed: $e');
}
```

### 2. Food Operations

```dart
// Get marketplace data
try {
  final marketplaceData = await networkService.food.getMarketplaceDashboard();
  print('Found ${marketplaceData.kitchens.length} kitchens');
} catch (e) {
  print('Failed to get marketplace: $e');
}

// Search and filter foods
try {
  final foods = await networkService.food.searchAndFilterFoods(
    query: 'pizza',
    category: 'Italian',
    minPrice: 10.0,
    maxPrice: 50.0,
    minRating: 4.0,
  );
  print('Found ${foods.length} foods');
} catch (e) {
  print('Search failed: $e');
}

// Create a review
final reviewRequest = CreateReviewRequest(
  comment: 'Great food!',
  rating: 5.0,
  foodId: 123,
);

try {
  final review = await networkService.food.createFoodReview(123, reviewRequest);
  print('Review created: ${review.comment}');
} catch (e) {
  print('Review creation failed: $e');
}
```

### 3. Order Operations

```dart
// Get cart
try {
  final cart = await networkService.order.getCart();
  print('Cart total: \$${cart.total}');
} catch (e) {
  print('Failed to get cart: $e');
}

// Add item to cart
final addToCartRequest = AddToCartRequest(
  foodId: 123,
  quantity: 2,
  specialInstructions: 'Extra cheese please',
);

try {
  final updatedCart = await networkService.order.addToCart(addToCartRequest);
  print('Item added to cart');
} catch (e) {
  print('Failed to add item: $e');
}

// Checkout
final checkoutRequest = CheckoutRequest(
  deliveryAddressId: 1,
  specialInstructions: 'Ring doorbell',
  paymentMethod: 'card',
);

try {
  final checkoutResponse = await networkService.order.checkout(checkoutRequest);
  print('Order placed: ${checkoutResponse.order.orderNumber}');
} catch (e) {
  print('Checkout failed: $e');
}
```

### 4. Profile Operations

```dart
// Get chef profile
try {
  final profile = await networkService.profile.getChefProfile();
  print('Chef: ${profile.firstName} ${profile.lastName}');
} catch (e) {
  print('Failed to get profile: $e');
}

// Update profile
final updateRequest = UpdateProfileRequest(
  firstName: 'Jane',
  lastName: 'Smith',
  bio: 'Passionate chef with 10 years experience',
);

try {
  final updatedProfile = await networkService.profile.updateChefProfile(updateRequest);
  print('Profile updated successfully');
} catch (e) {
  print('Profile update failed: $e');
}
```

### 5. Wallet Operations

```dart
// Get wallet balance
try {
  final balance = await networkService.wallet.getWalletBalance();
  print('Balance: \$${balance.balance}');
} catch (e) {
  print('Failed to get balance: $e');
}

// Fund wallet
final fundRequest = FundWalletRequest(
  amount: 100.0,
  bankCode: '001',
  accountNumber: '1234567890',
  accountName: 'John Doe',
);

try {
  final fundResponse = await networkService.wallet.fundWallet(fundRequest);
  print('Payment URL: ${fundResponse.paymentUrl}');
} catch (e) {
  print('Wallet funding failed: $e');
}
```

## Error Handling

The network layer provides comprehensive error handling:

```dart
try {
  final result = await networkService.auth.signIn(loginRequest);
  // Handle success
} on ApiException catch (e) {
  // Handle API errors (400, 404, etc.)
  print('API Error: ${e.message}');
} on NetworkException catch (e) {
  // Handle network connectivity issues
  print('Network Error: ${e.message}');
} on UnauthorizedException catch (e) {
  // Handle authentication errors
  print('Unauthorized: ${e.message}');
  // Navigate to login screen
} on ServerException catch (e) {
  // Handle server errors
  print('Server Error: ${e.message}');
} catch (e) {
  // Handle unexpected errors
  print('Unexpected Error: $e');
}
```

## Configuration

### Base URL
The API base URL is configured in `api_client.dart`:
```dart
static const String baseUrl = 'https://macky-customer-app-backend.onrender.com';
static const String apiVersion = '/api/v1';
```

### Authentication
Tokens are automatically managed by the ApiClient:
- Stored in SharedPreferences
- Added to request headers
- Handled on 401 responses

### Timeouts
- Connect timeout: 30 seconds
- Receive timeout: 30 seconds

## Best Practices

1. **Always handle exceptions** - Use try-catch blocks for all network calls
2. **Use typed models** - Leverage the generated JSON models for type safety
3. **Handle loading states** - Show loading indicators during network calls
4. **Cache when appropriate** - Store frequently accessed data locally
5. **Validate inputs** - Ensure data is valid before making requests
6. **Test error scenarios** - Test network failures and edge cases

## Testing

The network layer is designed to be easily testable:

```dart
// Mock the network service for testing
class MockNetworkService extends NetworkService {
  @override
  Future<SignupResponse> chefSignup(ChefSignupRequest request) async {
    // Return mock data
    return SignupResponse(
      message: 'Success',
      token: 'mock_token',
      user: UserData(/* mock user data */),
    );
  }
}
```

## Dependencies

The network layer requires these dependencies:
```yaml
dependencies:
  dio: ^5.4.0
  json_annotation: ^4.8.1
  shared_preferences: ^2.2.2
  connectivity_plus: ^5.0.2

dev_dependencies:
  json_serializable: ^6.7.1
  build_runner: ^2.4.7
```

## Generated Files

After running `dart run build_runner build`, these files are generated:
- `api_response.g.dart`
- `auth_models.g.dart`
- `food_models.g.dart`
- `order_models.g.dart`
- `profile_models.g.dart`
- `wallet_models.g.dart`

These contain the JSON serialization code for all models. 