import '../repositories/auth_repository.dart';
import '../entities/signup_entity.dart';

class SignupUsecase {
  final AuthRepository repository;

  SignupUsecase(this.repository);

  Future<SignupEntity> call(String phoneNumber, String password, String userType) {
    return repository.signup(phoneNumber, password, '', '', '', '', userType);
  }
} 