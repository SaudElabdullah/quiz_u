import 'dart:developer';

import 'package:quiz_u/app/home/models/leaderboard.dart';
import 'package:quiz_u/app/home/services/home_services.dart';

class HomeRepository {
  HomeRepository._();

  static HomeRepository? _instance;

  static HomeRepository get instance => _instance ??= HomeRepository._();
  List<Leaderboard> _leaderboards = [];

  Future<void> init(String token) async {
    await getLeaderboards(token);
  }

  Future<List<Leaderboard>> getLeaderboards(String token ,{bool refresh = false}) async {
    if (refresh || _leaderboards.isEmpty) {
      _leaderboards = await HomeServices.getLeaderboard(token);
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
