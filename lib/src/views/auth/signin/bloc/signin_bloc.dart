import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/bloc/index.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(SignInState initialState) : super(initialState) {
    on<SignInEvent>((event, emit) {
      return emit.forEach<SignInState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'AuthBloc', error: error, stackTrace: stackTrace);
          return ErrorAuthState(error.toString());
        },
      );
    });
  }
}
