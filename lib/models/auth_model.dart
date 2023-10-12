class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});
}

class RegistrationModel {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String email;
  final String password;

  RegistrationModel(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.email,
      required this.password});
}

class ForgotPasswordModel {
  final String number;

  ForgotPasswordModel({required this.number});
}

class OTPModel {
  final String number;

  OTPModel({required this.number});
}
