class SignupInputData {

  final String name;
  final String password;
  final String passwordConfirmation;
  final String email;
  final List<String> permissions;

  SignupInputData(
      this.name,
      this.password,
      this.passwordConfirmation,
      this.email,
      this.permissions);

}