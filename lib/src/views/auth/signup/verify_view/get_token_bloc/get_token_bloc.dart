import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/get_token_bloc/index.dart';

class GetTokenBloc extends Bloc<GetTokenEvent, GetTokenState> {

  GetTokenBloc(GetTokenState initialState) : super(initialState){
   on<GetTokenEvent>((event, emit) {
      return emit.forEach<GetTokenState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'GetTokenBloc', error: error, stackTrace: stackTrace);
          return ErrorGetTokenState(error.toString());
        },
      );
    });
  }
}
