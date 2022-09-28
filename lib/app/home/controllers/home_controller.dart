import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_u/app/home/models/leaderboard.dart';
import 'package:quiz_u/app/home/repositories/home_repository.dart';
import 'package:quiz_u/app/login/models/user.dart';
import 'package:quiz_u/core/database/isar_db.dart';

final homeViewProvider = FutureProvider.family<HomeController, BuildContext>((ref, context) async {
  User user = await IsarDB.getUser();
  List<Leaderboard> leaderboards = await HomeRepository.instance.getLeaderboards(
    user.token,
  );
  leaderboards.removeWhere((element) => element.name == 'No Name');
  return HomeController(
    user: user,
    leaderboards: leaderboards,
    ref: ref,
  );
});

class HomeController {
  User user = User(
    name: '',
    token: '',
    score: '',
    mobile: '',
  );
  List<Leaderboard> leaderboards;
  final FutureProviderRef<HomeController> ref;

  HomeController({
    required this.user,
    required this.leaderboards,
    required this.ref,
  });
}
