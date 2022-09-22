import 'package:quiz_u/app/leaderboard/models/leaderboard.dart';
import 'package:quiz_u/app/leaderboard/repositories/leaderboard_repository.dart';

class LeaderboardController {
  Future<List<Leaderboard>> getLeaderboards(String token) async {
    List<Leaderboard> leaderboards = await LeaderboardRepository.instance.getLeaderboards(token);
    leaderboards.removeWhere((element) => element.name == 'No Name');
    return leaderboards;
  }
}
