import 'package:flutter/material.dart';
import 'package:quiz_u/app/leaderboard/components/leaderboard_name.dart';
import 'package:quiz_u/app/leaderboard/controllers/leaderboard_controller.dart';
import 'package:quiz_u/app/leaderboard/models/leaderboard.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  State<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  late LeaderboardController controller;

  @override
  void initState() {
    controller = LeaderboardController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const Positioned(
          top: 50,
          child: Text(
            'Leaderboard',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        Positioned(
          top: 100,
          right: 50,
          left: 50,
          child: FutureBuilder<List<Leaderboard>>(
            future: controller.getLeaderboards(''),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LeaderboardName(
                        leaderboard: snapshot.data![index],
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
