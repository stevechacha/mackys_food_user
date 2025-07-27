import '../repositories/auth_repository.dart';
import '../entities/signup_entity.dart';

class VerifyTokenValidityUsecase {
  final AuthRepository repository;

  VerifyTokenValidityUsecase(this.repository);

  Future<SignupEntity> call(String token, {String? email, String? phoneNumber}) {
    return repository.verifyTokenValidity(token, email: email, phoneNumber: phoneNumber);
  }
} 