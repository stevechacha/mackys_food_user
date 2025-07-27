import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final String phoneNumber;
  final String password;
  final String userType;

  SignupSubmitted({
    required this.phoneNumber, 
    required this.password,
    required this.userType,
  });

  @override
  List<Object?> get props => [
    phoneNumber, 
    password, 
    userType
  ];
} 