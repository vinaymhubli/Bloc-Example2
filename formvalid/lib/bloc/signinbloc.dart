import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalid/bloc/signinevent.dart';
import 'package:formvalid/bloc/signinstate.dart';

class SigninBloc extends Bloc<SigninEvents, SigninState> {
  SigninBloc() : super(Signininitialstate()) {
    on<Signincredevent>((event, emit) {
      if (EmailValidator.validate(event.emailvalue) == false) {
        emit(Signinerrorstate("Enter a valid email"));
      } else if (event.passwordvalue.length <= 8) {
        emit(Signinerrorstate("Enter a valid password"));
      } else {
        emit(Signinvalidstate());
      }
    });
    on<Buttonpressevent>((event, emit) {
      emit(SigninLoadingstate());
    });
  }
}
