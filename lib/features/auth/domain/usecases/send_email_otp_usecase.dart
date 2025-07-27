import '../repositories/auth_repository.dart';

class SendEmailOtpUsecase {
  final AuthRepository repository;

  SendEmailOtpUsecase(this.repository);

  Future<void> call(String email) {
    return repository.sendEmailOtp(email);
  }
} 