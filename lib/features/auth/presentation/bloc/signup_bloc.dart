import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUsecase signupUsecase;

  SignupBloc(this.signupUsecase) : super(SignupInitial()) {
    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      try {
        final user = await signupUsecase(
          event.phoneNumber, 
          event.password,
          event.userType,
        );
        emit(SignupSuccess(user));
      } catch (e) {
        emit(SignupFailure(e.toString()));
      }
    });
  }
} 