import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/repositories/auth_repository.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../../../../utils/helpers/get_error_from_array_helper.dart';
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
    yield const InitialVerifyState();
  }
}

class SendVerifyEvent extends VerifyEvent {
  final VerifyTokenPayload verifyTokenPayload;

  SendVerifyEvent(this.verifyTokenPayload);

  @override
  Stream<VerifyState> applyAsync(
      {VerifyState? currentState, VerifyBloc? bloc}) async* {
    try {
      yield const LoadingVerifyState();
      var res =
          await AuthRepository().verifyToken(verifyTokenPayload: verifyTokenPayload);
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      if (res.$1?['message'] == 'success') {
        var val = VerifyTokenResponse.fromJson(res.$1!);
       
        yield VerifyLoadedVerifyState(val);
      } else {
         var message = getFirstNonNullItem(res.$1?['errors']!);
        yield ErrorVerifyState(message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAuthEvent', error: _, stackTrace: stackTrace);
      yield ErrorVerifyState(_.toString());
    }
  }
}
