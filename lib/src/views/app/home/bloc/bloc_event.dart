import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/logic/services/local_storage_service.dart';
import 'package:smart_pay_by_apex/src/repositories/app_repository.dart';
import 'package:smart_pay_by_apex/src/views/app/home/bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/app/home/model/home_secret_response.dart';
import 'package:smart_pay_by_apex/src/views/utils/constants.dart';

import '../../../../logic/logger/logger.dart';
import '../../../utils/enums.dart';

@immutable
abstract class BlocEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class UnBlocEvent extends BlocEvent {
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    yield InitialHomeState();
  }
}

class LoadBlocEvent extends BlocEvent {
  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield LoadinglHomeState();
      var res = await AppRepository().getSecret();
      if (res.$1?['message'] == 'success') {
        var val = HomeSecretResponse.fromJson(res.$1!);
        yield LoadedHomeState(val);
      } else {
        yield ErrorBlocState(res.$3.toString());
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorBlocState(_.toString());
    }
  }
}
