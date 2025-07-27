import 'package:equatable/equatable.dart';
import '../../domain/entities/signup_entity.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {
  final SignupEntity user;
  SignupSuccess(this.user);
  @override
  List<Object?> get props => [user];
}
class SignupFailure extends SignupState {
  final String error;
  SignupFailure(this.error);
  @override
  List<Object?> get props => [error];
} 