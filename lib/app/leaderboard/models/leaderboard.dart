class Leaderboard {
  String? name;
  int? score;

  Leaderboard({
    this.name,
    this.score,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Leaderboard && runtimeType == other.runtimeType && name == other.name && score == other.score);

  @override
  int get hashCode => name.hashCode ^ score.hashCode;

  @override
  String toString() {
    return 'Leaderboard{name: $name, score: $score,}';
  }

  Leaderboard copyWith({
    String? name,
    int? score,
  }) {
    return Leaderboard(
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }

  factory Leaderboard.fromMap(Map<String, dynamic> map) {
    return Leaderboard(
      name: map['name'] ?? 'No Name',
      score: map['score'] ?? 0,
    );
  }
}
