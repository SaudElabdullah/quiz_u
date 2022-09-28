import 'package:flutter/material.dart';
import 'package:quiz_u/app/home/models/leaderboard.dart';

class LeaderboardName extends StatelessWidget {
  final Leaderboard leaderboard;

  const LeaderboardName({
    Key? key,
    required this.leaderboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          leaderboard.name!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        trailing: Text(
          leaderboard.score!.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
