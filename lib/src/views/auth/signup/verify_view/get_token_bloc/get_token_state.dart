import 'package:equatable/equatable.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_response.dart';

abstract class GetTokenState extends Equatable {
  const GetTokenState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class InitialGetTokenState extends GetTokenState {
  const InitialGetTokenState();

  @override
  String toString() => 'UnGetTokenState';
}

/// LoadingGetTokenState
class LoadingGetTokenState extends GetTokenState {
  const LoadingGetTokenState();

  @override
  String toString() => 'LoadingGetTokenState';
}

/// Initialized
class LoadedGetTokenState extends GetTokenState {
  const LoadedGetTokenState(this.getTokenResponse);

  final GetTokenResponse getTokenResponse;

  @override
  String toString() => 'InGetTokenState $getTokenResponse';

  @override
  List<Object> get props => [getTokenResponse];
}

class ErrorGetTokenState extends GetTokenState {
  const ErrorGetTokenState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorGetTokenState';

  @override
  List<Object> get props => [errorMessage];
}
