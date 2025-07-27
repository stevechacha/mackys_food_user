import '../repositories/auth_repository.dart';
import '../entities/signup_entity.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<SignupEntity> call(String phoneNumber, String password) {
    return repository.login(phoneNumber, password);
  }
} 