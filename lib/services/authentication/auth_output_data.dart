class AuthOutputData {

  final String username;
  final String token;
  final List<String> permissions;

  AuthOutputData(this.username, this.token, this.permissions);

  factory AuthOutputData.fromJson(Map<String, dynamic> json) {
    return AuthOutputData(json['username'], json['token'], json['permissions'].cast<String>());
  }

  @override
  String toString() {
    return "username: $username, token: $token";
  }
}