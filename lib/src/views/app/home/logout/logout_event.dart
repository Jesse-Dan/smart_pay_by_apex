// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_pay_by_apex/src/repositories/auth_repository.dart';
import 'package:smart_pay_by_apex/src/views/app/home/logout/index.dart';
import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/views/app/home/model/logout_response.dart';

import '../../../../logic/logger/logger.dart';
import '../../../utils/enums.dart';

@immutable
abstract class LogoutEvent {
  Stream<LogoutState> applyAsync({LogoutState currentState, LogoutBloc bloc});
}

class UnLogoutEvent extends LogoutEvent {
  @override
  Stream<LogoutState> applyAsync(
      {LogoutState? currentState, LogoutBloc? bloc}) async* {
    yield const UnLogoutState();
  }
}

class LoadLogoutEvent extends LogoutEvent {
  @override
  Stream<LogoutState> applyAsync(
      {LogoutState? currentState, LogoutBloc? bloc}) async* {
    try {
      yield const UnLogoutState();
      var res = await AuthRepository().logout();
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      if (res.$1?['message'] == 'success') {
        var val = LogoutResponse.fromJson(res.$1!);

        yield InLogoutState(val);
      } else {
        yield ErrorLogoutState(res.$3.toString());
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLogoutEvent', error: _, stackTrace: stackTrace);
      yield ErrorLogoutState(_.toString());
    }
  }
}
