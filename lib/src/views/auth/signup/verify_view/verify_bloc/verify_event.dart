import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/logic/services/local_storage_service.dart';
import 'package:smart_pay_by_apex/src/repositories/auth_repository.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/signup_view/model/signup_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/signup_view/model/signup_response.dart';
import 'package:smart_pay_by_apex/src/views/utils/constants.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../model/verify_token_payload.dart';
import '../model/verify_token_response.dart';
import 'index.dart';

@immutable
abstract class VerifyEvent {
  Stream<VerifyState> applyAsync({VerifyState currentState, VerifyBloc bloc});
}

class UnAuthEvent extends VerifyEvent {
  @override
  Stream<VerifyState> applyAsync(
      {VerifyState? currentState, VerifyBloc? bloc}) async* {
    yield InitialVerifyState();
  }
}

class SendVerifyEvent extends VerifyEvent {
  final VerifyTokenPayload verifyTokenPayload;

  SendVerifyEvent(this.verifyTokenPayload);

  @override
  Stream<VerifyState> applyAsync(
      {VerifyState? currentState, VerifyBloc? bloc}) async* {
    try {
      yield LoadingVerifyState();
      var res =
          await AuthRepository().verifyToken(verifyTokenPayload: verifyTokenPayload);
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      if (res.$1?['message'] == 'success') {
        var val = VerifyTokenResponse.fromJson(res.$1!);
       
        yield VerifyLoadedVerifyState(val);
      } else {
        yield ErrorVerifyState(res.$3.toString());
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAuthEvent', error: _, stackTrace: stackTrace);
      yield ErrorVerifyState(_.toString());
    }
  }
}
