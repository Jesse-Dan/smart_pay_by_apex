import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/logic/services/local_storage_service.dart';
import 'package:smart_pay_by_apex/src/repositories/auth_repository.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/utils/constants.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../../../utils/helpers/get_error_from_array_helper.dart';
import '../../models/payloads/signin_payload.dart';

@immutable
abstract class SignInEvent {
  Stream<SignInState> applyAsync({SignInState currentState, SignInBloc bloc});
}

class UnAuthEvent extends SignInEvent {
  @override
  Stream<SignInState> applyAsync(
      {SignInState? currentState, SignInBloc? bloc}) async* {
    yield const InitialAuthState();
  }
}

class LoginEvent extends SignInEvent {
  final SignInPayload signInPayload;

  LoginEvent({required this.signInPayload});
  @override
  Stream<SignInState> applyAsync(
      {SignInState? currentState, SignInBloc? bloc}) async* {
    try {
      yield const LoadingAuthState();
      var res = await AuthRepository().login(signInPayload: signInPayload);
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      if (res.$1?['message'] == 'success') {
        var val = SignInResponse.fromJson(res.$1!);
        LocalStorageService.setString(Constants.bearerToken, val.data!.token!);
        User.setPresentUser(val.data!.user!);
        Logger.log(
            tag: Tag.DEBUG,
            message:
                'User Logged at LoginEvent: ${User.getPresentUser()!.email!}');
        yield SignInLoadedAuthState(val);
      } else {
        var message = getFirstNonNullItem(res.$1?['errors']!);
        yield ErrorAuthState(message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAuthEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthState(_.toString());
    }
  }
}
