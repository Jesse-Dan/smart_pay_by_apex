import 'package:equatable/equatable.dart';

import '../model/logout_response.dart';

abstract class LogoutState extends Equatable {
  LogoutState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnLogoutState extends LogoutState {
  UnLogoutState();

  @override
  String toString() => 'UnLogoutState';
}

/// Loading
class LoadingLogoutState extends LogoutState {
  LoadingLogoutState();

  @override
  String toString() => 'LoadingLogoutState';
}

/// Initialized
class InLogoutState extends LogoutState {
  InLogoutState(this._logoutResponse);

  final LogoutResponse _logoutResponse;

  @override
  String toString() => 'InLogoutState $_logoutResponse';

  @override
  List<Object> get props => [_logoutResponse];
}

class ErrorLogoutState extends LogoutState {
  ErrorLogoutState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLogoutState';

  @override
  List<Object> get props => [errorMessage];
}
