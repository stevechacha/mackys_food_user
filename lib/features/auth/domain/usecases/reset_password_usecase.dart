import '../repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  Future<void> call(String token, String newPassword, String confirmPassword) {
    return repository.resetPassword(token, newPassword, confirmPassword);
  }
} 