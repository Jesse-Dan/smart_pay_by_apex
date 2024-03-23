import 'package:equatable/equatable.dart';

import '../model/signup_response.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

/// LoadingSignUpState
class LoadingSignUpState extends SignUpState {
  const LoadingSignUpState();

  @override
  String toString() => 'LoadingSignUpState';
}

/// InitialSignUpState
class InitialSignUpState extends SignUpState {
  const InitialSignUpState();

  @override
  String toString() => 'UnSignUpState';
}

/// Initialized
class SignUpLoadedSignUpState extends SignUpState {
  const SignUpLoadedSignUpState(this.signUpResponse);

  final SignUpResponse signUpResponse;

  @override
  String toString() => 'InSignUpState $signUpResponse';

  @override
  List<Object> get props => [signUpResponse];
}

class ErrorSignUpState extends SignUpState {
  const ErrorSignUpState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorSignUpState';

  @override
  List<Object> get props => [errorMessage];
}
