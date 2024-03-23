import 'package:equatable/equatable.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';

abstract class SignInState extends Equatable {
  SignInState();

  @override
  List<Object> get props => [];
}

/// LoadingAuthState
class LoadingAuthState extends SignInState {
  LoadingAuthState();

  @override
  String toString() => 'LoadingAuthState';
}

/// InitialAuthState
class InitialAuthState extends SignInState {
  InitialAuthState();

  @override
  String toString() => 'UnAuthState';
}

/// Initialized
class SignInLoadedAuthState extends SignInState {
  SignInLoadedAuthState(this.authResponse);

  final SignInResponse authResponse;

  @override
  String toString() => 'InAuthState $authResponse';

  @override
  List<Object> get props => [authResponse];
}

class ErrorAuthState extends SignInState {
  ErrorAuthState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorAuthState';

  @override
  List<Object> get props => [errorMessage];
}
