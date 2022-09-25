import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String name;
  String token;
  String score;
  String mobile;

  User({
    required this.name,
    required this.token,
    required this.score,
    required this.mobile,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          token == other.token &&
          score == other.score &&
          mobile == other.mobile);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ token.hashCode ^ score.hashCode ^ mobile.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, token: $token, score: $score, mobile: $mobile,}';
  }

  User copyWith({
    Id? id,
    String? name,
    String? token,
    String? score,
    String? mobile,
  }) {
    return User(
      name: name ?? this.name,
      token: token ?? this.token,
      score: score ?? this.score,
      mobile: mobile ?? this.mobile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'token': this.token,
      'score': this.score,
      'mobile': this.mobile,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      token: map['token'] as String,
      score: map['score'] as String,
      mobile: map['mobile'] as String,
    );
  }
}
