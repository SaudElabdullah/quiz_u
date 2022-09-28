import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  String name;
  String token;
  String score;
  String mobile;
  List<String?>? scores;

  User({
    this.id = 0,
    required this.name,
    required this.token,
    required this.score,
    required this.mobile,
    this.scores,
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
          mobile == other.mobile &&
          scores == other.scores);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ token.hashCode ^ score.hashCode ^ mobile.hashCode ^ scores.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' name: $name,' +
        ' token: $token,' +
        ' score: $score,' +
        ' mobile: $mobile,' +
        ' scores: $scores,' +
        '}';
  }

  User copyWith({
    Id? id,
    String? name,
    String? token,
    String? score,
    String? mobile,
    List<String?>? scores,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
      score: score ?? this.score,
      mobile: mobile ?? this.mobile,
      scores: scores ?? this.scores,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'token': this.token,
      'score': this.score,
      'mobile': this.mobile,
      'scores': this.scores,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as Id,
      name: map['name'] as String,
      token: map['token'] as String,
      score: map['score'] as String,
      mobile: map['mobile'] as String,
      scores: map['scores'] as List<String?>,
    );
  }
}
