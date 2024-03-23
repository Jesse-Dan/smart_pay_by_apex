import 'package:equatable/equatable.dart';

import '../model/logout_response.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnLogoutState extends LogoutState {
  const UnLogoutState();

  @override
  String toString() => 'UnLogoutState';
}

/// Loading
class LoadingLogoutState extends LogoutState {
  const LoadingLogoutState();

  @override
  String toString() => 'LoadingLogoutState';
}

/// Initialized
class InLogoutState extends LogoutState {
  const InLogoutState(this._logoutResponse);

  final LogoutResponse _logoutResponse;

  @override
  String toString() => 'InLogoutState $_logoutResponse';

  @override
  List<Object> get props => [_logoutResponse];
}

class ErrorLogoutState extends LogoutState {
  const ErrorLogoutState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLogoutState';

  @override
  List<Object> get props => [errorMessage];
}
