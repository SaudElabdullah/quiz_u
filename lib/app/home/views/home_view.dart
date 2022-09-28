import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_u/app/home/components/leaderboard_name.dart';
import 'package:quiz_u/app/home/controllers/home_controller.dart';
import 'package:quiz_u/app/home/models/leaderboard.dart';
import 'package:quiz_u/app/login/views/login_view.dart';
import 'package:quiz_u/app/quiz/views/quiz_view.dart';
import 'package:quiz_u/core/animations/bounce.dart';
import 'package:quiz_u/core/database/isar_db.dart';
import 'package:quiz_u/core/utils/pop_up.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeViewProvider(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Quiz U',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.timelapse_rounded,
              size: 35,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 40,
              right: 20,
              left: 20,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.when(
                          data: (controller) => '${controller.user.name}',
                          error: (_, __) => 'Error',
                          loading: () => 'Loading',
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: Color(0xFF3c3c3b),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.when(
                          data: (controller) => '${controller.user.mobile}',
                          error: (_, __) => 'Error',
                          loading: () => 'Loading',
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Color(0xFF3c3c3b),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Bounce(
                    function: () {
                      IsarDB.deleteUser();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  Text(
                    controller.when(
                      data: (controller) => 'Top Score ${controller.user.score}',
                      error: (_, __) => 'Error',
                      loading: () => 'Loading',
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF3c3c3b),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Bounce(
                    function: () async {
                      await showAlert(
                        context: context,
                        isDismissible: true,
                        buttonText: 'OK',
                        title: 'Scores',
                        messageOne: controller.value!.user.scores.toString(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Text(
                        'Show Scores',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Bounce(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizView(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Text(
                        'Quiz Me',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 230,
              left: 20,
              child: Text(
                'LeaderBoard',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xFF3c3c3b),
                ),
              ),
            ),
            Positioned(
              top: 270,
              right: 20,
              left: 20,
              bottom: 0,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.when(
                  data: (controller) => controller.leaderboards.length,
                  error: (_, __) => 0,
                  loading: () => 0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1,
                    ),
                    child: LeaderboardName(
                      leaderboard: controller.when(
                        data: (controller) => controller.leaderboards[index],
                        error: (_, __) => Leaderboard(
                          name: 'loading',
                          score: 0,
                        ),
                        loading: () => Leaderboard(
                          name: 'loading',
                          score: 0,
                        ),
                      ),
                    ).animate().fadeIn().slide(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
