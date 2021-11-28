import 'package:family_care_app/model/self.dart';

class Links {
  final Self self;

  Links(this.self);

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(Self.fromJson(json['self']));
  }
}