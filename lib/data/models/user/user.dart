import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Temp class for user data
@JsonSerializable(explicitToJson: true)
class User {
  /// The name od the user
  String? name;

  ///
  String? email;

  User({
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
