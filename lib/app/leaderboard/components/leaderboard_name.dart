import 'package:flutter/material.dart';
import 'package:quiz_u/app/leaderboard/models/leaderboard.dart';

class LeaderboardName extends StatelessWidget {
  final Leaderboard leaderboard;

  const LeaderboardName({
    Key? key,
    required this.leaderboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        leaderboard.name!,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      trailing: Text(
        leaderboard.score!.toString(),
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
