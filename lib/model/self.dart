class Self {

  final String href;

  Self(this.href);

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(json['href']);
  }
}