import 'package:equatable/equatable.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';

import '../model/signup_response.dart';

abstract class SignUpState extends Equatable {
  SignUpState();

  @override
  List<Object> get props => [];
}

/// LoadingSignUpState
class LoadingSignUpState extends SignUpState {
  LoadingSignUpState();

  @override
  String toString() => 'LoadingSignUpState';
}

/// InitialSignUpState
class InitialSignUpState extends SignUpState {
  InitialSignUpState();

  @override
  String toString() => 'UnSignUpState';
}

/// Initialized
class SignUpLoadedSignUpState extends SignUpState {
  SignUpLoadedSignUpState(this.signUpResponse);

  final SignUpResponse signUpResponse;

  @override
  String toString() => 'InSignUpState $signUpResponse';

  @override
  List<Object> get props => [signUpResponse];
}

class ErrorSignUpState extends SignUpState {
  ErrorSignUpState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorSignUpState';

  @override
  List<Object> get props => [errorMessage];
}
