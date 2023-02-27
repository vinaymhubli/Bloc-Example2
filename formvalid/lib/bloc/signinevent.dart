abstract class SigninEvents {}

class Signincredevent extends SigninEvents {
  final String emailvalue;
  final String passwordvalue;
  Signincredevent(this.emailvalue, this.passwordvalue);
}

class Buttonpressevent extends SigninEvents {
  final String email;
  final String password;
  Buttonpressevent(this.email, this.password);
}
