import 'package:equatable/equatable.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

/// LoadingAuthState
class LoadingAuthState extends SignInState {
  const LoadingAuthState();

  @override
  String toString() => 'LoadingAuthState';
}

/// InitialAuthState
class InitialAuthState extends SignInState {
  const InitialAuthState();

  @override
  String toString() => 'UnAuthState';
}

/// Initialized
class SignInLoadedAuthState extends SignInState {
  const SignInLoadedAuthState(this.authResponse);

  final SignInResponse authResponse;

  @override
  String toString() => 'InAuthState $authResponse';

  @override
  List<Object> get props => [authResponse];
}

class ErrorAuthState extends SignInState {
  const ErrorAuthState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorAuthState';

  @override
  List<Object> get props => [errorMessage];
}
