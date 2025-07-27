import '../repositories/auth_repository.dart';
import '../entities/signup_entity.dart';

class CompleteCustomerProfileUsecase {
  final AuthRepository repository;

  CompleteCustomerProfileUsecase(this.repository);

  Future<SignupEntity> call(String email, String firstName, String lastName, String birthDate, String otpCode) {
    return repository.completeCustomerProfile(email, firstName, lastName, birthDate, otpCode);
  }
} 