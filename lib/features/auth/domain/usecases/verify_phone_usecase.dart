import '../repositories/auth_repository.dart';
import '../entities/signup_entity.dart';

class VerifyPhoneUsecase {
  final AuthRepository repository;

  VerifyPhoneUsecase(this.repository);

  Future<SignupEntity> call(String phoneNumber, String otp, String userType) {
    return repository.verifyPhoneNumber(phoneNumber, otp, userType);
  }
} 