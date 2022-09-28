import 'package:isar/isar.dart';

import '../../app/login/models/user.dart';

class IsarDB {
  static late Isar isar;

  static Future<void> initDB() async {
    isar = await Isar.open([UserSchema]);
    return;
  }

  static closeDB() async {
    isar.close();
  }

  static Future<User> getUser() async {
    List<User> users = await isar.users.where().findAll();
    if (users.isNotEmpty) {
      return users.first;
    } else {
      return User(
        name: '',
        token: '',
        score: '',
        mobile: '',
      );
    }
  }

  static void addUser(
    String? name,
    String token,
    String? score,
    String mobile,
  ) async {
    final newUser = User(
      name: name ?? '',
      token: token,
      score: score ?? '0',
      mobile: mobile,
    );
    await isar.writeTxn(() async {
      await isar.users.put(newUser);
    });
  }

  static Future<void> deleteUser() async {
    await isar.writeTxn(() async {
      await IsarDB.isar.users.clear();
    });
  }

  static Future<void> updateUserName(
    String name,
  ) async {
    final User user = await getUser();
    user.name = name;
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  static void updateUserToken(
    String token,
  ) async {
    final User user = await getUser();
    user.token = token;
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  static void updateUserScore(
    String score,
  ) async {
    User user = await getUser();
    user.score = score;
    if (user.scores != null) {
      user.scores!.add(score);
    } else {
      user.scores = [score];
    }
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  static void updateUserMobile(
    String mobile,
  ) async {
    User user = await getUser();
    user.mobile = mobile;
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }
}
