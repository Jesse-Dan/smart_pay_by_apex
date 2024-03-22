import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/get_token_bloc/index.dart';
import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_response.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../../../../../logic/logger/logger.dart';
import '../../../../../repositories/auth_repository.dart';
import '../model/verify_token_response.dart';

@immutable
abstract class GetTokenEvent {
  Stream<GetTokenState> applyAsync(
      {GetTokenState currentState, GetTokenBloc bloc});
}

class UnGetTokenEvent extends GetTokenEvent {
  @override
  Stream<GetTokenState> applyAsync(
      {GetTokenState? currentState, GetTokenBloc? bloc}) async* {
    yield InitialGetTokenState();
  }
}

class LoadGetTokenEvent extends GetTokenEvent {
  final GetTokenPayload getTokenPayload;

  LoadGetTokenEvent({required this.getTokenPayload});

  @override
  Stream<GetTokenState> applyAsync(
      {GetTokenState? currentState, GetTokenBloc? bloc}) async* {
    try {
      yield LoadingGetTokenState();
      var res =
          await AuthRepository().getToken(getTokenPayload: getTokenPayload);
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      if (res.$1?['message'] == 'success') {
        var val = GetTokenResponse.fromJson(res.$1!);

        yield LoadedGetTokenState(val);
      } else {
        yield ErrorGetTokenState(res.$3.toString());
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGetTokenEvent', error: _, stackTrace: stackTrace);
      yield ErrorGetTokenState(_.toString());
    }
  }
}
