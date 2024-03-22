import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'verify_event.dart';
import 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  VerifyBloc(VerifyState initialState) : super(initialState) {
    on<VerifyEvent>((event, emit) {
      return emit.forEach<VerifyState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'VerifyBloc', error: error, stackTrace: stackTrace);
          return ErrorVerifyState(error.toString());
        },
      );
    });
  }
}
