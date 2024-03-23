// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/get_token_bloc/index.dart';
import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_response.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../../../../../logic/logger/logger.dart';
import '../../../../../repositories/auth_repository.dart';
import '../../../../utils/components/app_notifier.dart';

@immutable
abstract class GetTokenEvent {
  Stream<GetTokenState> applyAsync(
      {GetTokenState currentState, GetTokenBloc bloc});
}

class UnGetTokenEvent extends GetTokenEvent {
  @override
  Stream<GetTokenState> applyAsync(
      {GetTokenState? currentState, GetTokenBloc? bloc}) async* {
    yield const InitialGetTokenState();
  }
}

class LoadGetTokenEvent extends GetTokenEvent {
  final GetTokenPayload getTokenPayload;

  LoadGetTokenEvent({required this.getTokenPayload});

  @override
  Stream<GetTokenState> applyAsync(
      {GetTokenState? currentState, GetTokenBloc? bloc}) async* {
    try {
      yield const LoadingGetTokenState();
      var res =
          await AuthRepository().getToken(getTokenPayload: getTokenPayload);
      // var demoResponse = {
      //   "status": true,
      //   "message": "success",
      //   "data": {"token": "55930"},
      //   "meta": [],
      //   "pagination": []
      // };
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      // Logger.log(tag: Tag.DEBUG, message: demoResponse.toString());
      if (res.$1?['message'] == 'success') {
        // if (demoResponse['message'] == 'success') {
        var val = GetTokenResponse.fromJson(res.$1!);
        // var val = GetTokenResponse.fromJson(demoResponse);
        AppNotifier.notifyAction(getTokenPayload.context,
            message: 'Token: ${val.data!.token!}');
        yield LoadedGetTokenState(val);
      } else {
        yield ErrorGetTokenState(res.$3.toString());
        // yield ErrorGetTokenState(demoResponse['message'].toString());
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGetTokenEvent', error: _, stackTrace: stackTrace);
      yield ErrorGetTokenState(_.toString());
    }
  }
}
