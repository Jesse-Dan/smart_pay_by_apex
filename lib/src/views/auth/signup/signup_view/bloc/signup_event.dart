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

import '../../../../utils/helpers/get_error_from_array_helper.dart';
import 'index.dart';

@immutable
abstract class SignUpEvent {
  Stream<SignUpState> applyAsync(
      {SignUpState currentState, SendSignUpBloc bloc});
}

class UnAuthEvent extends SignUpEvent {
  @override
  Stream<SignUpState> applyAsync(
      {SignUpState? currentState, SendSignUpBloc? bloc}) async* {
    yield const InitialSignUpState();
  }
}

class SendSignUpEvent extends SignUpEvent {
  final SignUpPayload signUpPayload;

  SendSignUpEvent(this.signUpPayload);
  @override
  Stream<SignUpState> applyAsync(
      {SignUpState? currentState, SendSignUpBloc? bloc}) async* {
    try {
      yield const LoadingSignUpState();
      var res = await AuthRepository().signup(signUpPayload: signUpPayload);
      Logger.log(tag: Tag.DEBUG, message: res.$1.toString());
      if (res.$1?['message'] == 'success') {
        var val = SignUpResponse.fromJson(res.$1!);
        LocalStorageService.setString(Constants.bearerToken, val.data!.token!);
        
        User.setPresentUser(val.data!.user!);
          Logger.log(
            tag: Tag.DEBUG,
            message:
                'User Logged at LoginEvent: ${User.getPresentUser()!.email!}');
        yield SignUpLoadedSignUpState(val);
      } else {
        var message = getFirstNonNullItem(res.$1?['errors']!);
        yield ErrorSignUpState(message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAuthEvent', error: _, stackTrace: stackTrace);
      yield ErrorSignUpState(_.toString());
    }
  }
}
