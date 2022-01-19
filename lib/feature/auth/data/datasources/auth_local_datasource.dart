import 'package:appdevassignment/feature/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class AuthLocalDataSource {
  Future<User?> getUser();

  Future<User?> logoutUser();

  Future<User?> authenticateUser(String mobile, String password);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String userKey = "USER";

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<User?> getUser() {
    String? val = sharedPreferences.getString(userKey);
    if (val != null) {
      List<String> requiredKeys = ["mobileNumber","password","name","eloRating","tournamentPlayed","tournamentWon","profileUrl"];
      for(var key in requiredKeys){
        if(!val.contains(key)){
          return Future.value(null);
        }
      }
      return Future.value(User.fromJson(json.decode(val)));
    }

    return Future.value(null);
  }

  @override
  Future<User?> authenticateUser(String mobile, String password) {
    User? user;
    if (mobile == "9898989898" && password == "password123") {
      user = User(
          mobileNumber: mobile,
          password: password,
          name: "Simon Baker",
          eloRating: 2250,
          tournamentPlayed: 34,
          tournamentWon: 9,
      profileUrl: "https://i.imgur.com/BoN9kdC.png");
    }

    if (mobile == "9876543210" && password == "password123") {
      user = User(
          mobileNumber: mobile,
          password: password,
          name: "Shubham Chhimpa",
          eloRating: 2000,
          tournamentPlayed: 20,
          tournamentWon: 12,
      profileUrl: "https://www.fillmurray.com/640/360");
    }

    if (user != null) {
      sharedPreferences.setString(userKey, json.encode(user.toJson()));
      return Future.value(user);
    }

    return Future.value(null);
  }

  @override
  Future<User?> logoutUser() async {
    sharedPreferences.remove(userKey);
    return Future.value(null);
  }
}
