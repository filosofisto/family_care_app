class SigninOutputData {

  final String email;
  final String name;
  final String token;
  final List<String> permissions;

  SigninOutputData(this.email, this.name, this.token, this.permissions);

  factory SigninOutputData.fromJson(Map<String, dynamic> json) {
    return SigninOutputData(
        json['email'],
        json['name'],
        json['token'],
        json['permissions'].cast<String>());
  }

  @override
  String toString() {
    return "email: $email, token: $token";
  }
}