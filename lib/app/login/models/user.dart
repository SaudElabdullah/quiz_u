import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String name;
  String token;
  String score;

  User({
    required this.name,
    required this.token,
    required this.score,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          token == other.token &&
          score == other.score);

  @override
  int get hashCode => name.hashCode ^ token.hashCode ^ score.hashCode;

  @override
  String toString() {
    return 'User{name: $name, token: $token, score: $score,}';
  }

  User copyWith({
    String? name,
    String? token,
    String? score,
  }) {
    return User(
      name: name ?? this.name,
      token: token ?? this.token,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'token': token,
      'score': score,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      token: map['token'] as String,
      score: map['score'] as String,
    );
  }
}
