import '../../../core/networking/api_error_model.dart';
import '../model/signup_response_body.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  final SignupResponseBody? signupResponseBody;

  SignupSuccessState({this.signupResponseBody});
}

class SignupErrorState extends SignupStates {

ApiErrorModel apiErrorModel;
SignupErrorState({ required this.apiErrorModel});


}
class SignupPasswordValidationState extends SignupStates {}

// part of 'signup_cubit.dart';

// @freezed
// class SignupState with _$SignupState {
//   const factory SignupState.initial() = _Initial;
//   const factory SignupState.loading() = _Loading;
//   const factory SignupState.loaded() = _Loaded;
// }
