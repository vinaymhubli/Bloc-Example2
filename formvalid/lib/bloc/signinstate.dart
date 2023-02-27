abstract class SigninState {}

class Signininitialstate extends SigninState {}

class Signinvalidstate extends SigninState {}

class Signinerrorstate extends SigninState {
  final String errorMessage;
  Signinerrorstate(this.errorMessage);
}

class SigninLoadingstate extends SigninState {}
