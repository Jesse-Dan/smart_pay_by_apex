import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:smart_pay_by_apex/src/views/app/home/bloc/index.dart';

class HomeBloc extends Bloc<BlocEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<BlocEvent>((event, emit) {
      return emit.forEach<HomeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'BlocBloc', error: error, stackTrace: stackTrace);
          return ErrorBlocState(error.toString());
        },
      );
    });
  }
}
