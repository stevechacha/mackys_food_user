import '../repositories/auth_repository.dart';
import '../entities/signup_entity.dart';

class ForgotPasswordUsecase {
  final AuthRepository repository;

  ForgotPasswordUsecase(this.repository);

  Future<SignupEntity> call(String phoneNumber, String email, String password, String token) {
    return repository.forgotPassword(phoneNumber, email, password, token);
  }
} 