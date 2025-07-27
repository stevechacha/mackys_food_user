import 'api_client.dart';
import 'services/auth_service.dart';
import 'services/food_service.dart';
import 'services/order_service.dart';
import 'services/profile_service.dart';
import 'services/wallet_service.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  late final ApiClient _apiClient = ApiClient();
  
  // Services
  late final AuthService auth = AuthService(_apiClient);
  late final FoodService food = FoodService(_apiClient);
  late final OrderService order = OrderService(_apiClient);
  late final ProfileService profile = ProfileService(_apiClient);
  late final WalletService wallet = WalletService(_apiClient);

  // Getter for direct API client access if needed
  ApiClient get apiClient => _apiClient;

  // Initialize network service
  static Future<void> initialize() async {
    // Any initialization logic can go here
    // For example, checking connectivity, setting up interceptors, etc.
  }

  // Dispose method for cleanup
  void dispose() {
    // Cleanup logic if needed
  }
}

// Global instance for easy access
final networkService = NetworkService(); 