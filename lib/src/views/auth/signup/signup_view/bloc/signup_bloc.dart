import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SendSignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SendSignUpBloc(SignUpState initialState) : super(initialState) {
    on<SignUpEvent>((event, emit) {
      return emit.forEach<SignUpState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'SendSignUpBloc', error: error, stackTrace: stackTrace);
          return ErrorSignUpState(error.toString());
        },
      );
    });
  }
}
