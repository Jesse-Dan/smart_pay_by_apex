import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:smart_pay_by_apex/src/views/app/home/logout/index.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {

  LogoutBloc(LogoutState initialState) : super(initialState){
   on<LogoutEvent>((event, emit) {
      return emit.forEach<LogoutState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'LogoutBloc', error: error, stackTrace: stackTrace);
          return ErrorLogoutState(error.toString());
        },
      );
    });
  }
}
