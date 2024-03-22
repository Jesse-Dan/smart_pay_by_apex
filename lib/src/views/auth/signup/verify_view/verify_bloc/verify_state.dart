import 'package:equatable/equatable.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/verify_token_response.dart';


abstract class VerifyState extends Equatable {
  VerifyState();

  @override
  List<Object> get props => [];
}

/// LoadingVerifyState
class LoadingVerifyState extends VerifyState {
  LoadingVerifyState();

  @override
  String toString() => 'LoadingVerifyState';
}

/// InitialVerifyState
class InitialVerifyState extends VerifyState {
  InitialVerifyState();

  @override
  String toString() => 'UnVerifyState';
}

/// Initialized
class VerifyLoadedVerifyState extends VerifyState {
  VerifyLoadedVerifyState(this.verifyTokenResponse);

  final VerifyTokenResponse verifyTokenResponse;

  @override
  String toString() => 'InVerifyState $verifyTokenResponse';

  @override
  List<Object> get props => [verifyTokenResponse];
}

class ErrorVerifyState extends VerifyState {
  ErrorVerifyState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorVerifyState';

  @override
  List<Object> get props => [errorMessage];
}
