import 'package:equatable/equatable.dart';
import 'package:smart_pay_by_apex/src/views/app/home/model/home_secret_response.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class InitialHomeState extends HomeState {
  const InitialHomeState();

  @override
  String toString() => 'InitialHomeState';
}

/// UnInitialized
class LoadinglHomeState extends HomeState {
  const LoadinglHomeState();

  @override
  String toString() => 'LoadinglHomeState';
}

/// Initialized
class LoadedHomeState extends HomeState {
  const LoadedHomeState(this.response);

  final HomeSecretResponse response;

  @override
  String toString() => 'LoadedHomeState $response';

  @override
  List<Object> get props => [response];
}

class ErrorBlocState extends HomeState {
  const ErrorBlocState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorBlocState $errorMessage';

  @override
  List<Object> get props => [errorMessage];
}
