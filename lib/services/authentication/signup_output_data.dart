class SignupOutputData {

  final String name;
  final String email;
  final List<String> permissions;

  SignupOutputData(this.name, this.email, this.permissions);

  factory SignupOutputData.fromJson(Map<String, dynamic> json) {
    return SignupOutputData(
        json['name'],
        json['email'],
        json['permissions'].cast<String>());
  }

  @override
  String toString() {
    return "name: $name, email: $email";
  }
}