import 'dart:developer';

import 'package:quiz_u/app/leaderboard/models/leaderboard.dart';
import 'package:quiz_u/app/leaderboard/services/leaderboard_services.dart';

class LeaderboardRepository {
  LeaderboardRepository._();

  static LeaderboardRepository? _instance;

  static LeaderboardRepository get instance => _instance ??= LeaderboardRepository._();
  List<Leaderboard> _leaderboards = [];

  Future<void> init(String token) async {
    await getLeaderboards(token);
  }

  Future<List<Leaderboard>> getLeaderboards(String token ,{bool refresh = false}) async {
    if (refresh || _leaderboards.isEmpty) {
      _leaderboards = await LeaderboardServices.getLeaderboard(token);
    }
    else {
      log("Leaderboards already in cache");
    }
    return _leaderboards;
  }

  void clear() {
    _leaderboards.clear();
  }
}
