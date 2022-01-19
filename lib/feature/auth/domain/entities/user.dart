import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String mobileNumber;
  final String password;
  final String name;
  final int eloRating;
  final int tournamentPlayed;
  final int tournamentWon;
  final String profileUrl;

  const User(
      {required this.mobileNumber,
        required this.password,
        required this.name,
        required this.eloRating,
        required this.tournamentPlayed,
        required this.tournamentWon,
        required this.profileUrl});

  @override
  List<Object> get props => [mobileNumber, password, name, eloRating];

  User.fromJson(Map<String, dynamic> json)
      : mobileNumber = json['mobileNumber'],
        password = json['password'],
        name = json['name'],
        eloRating = json['eloRating'],
        tournamentPlayed = json['tournamentPlayed'],
        tournamentWon = json['tournamentWon'],
        profileUrl = json['profileUrl'];

  Map<String, dynamic> toJson() => {
    'mobileNumber': mobileNumber,
    'password': password,
    'eloRating': eloRating,
    'name': name,
    'tournamentPlayed': tournamentPlayed,
    'tournamentWon': tournamentWon,
    'profileUrl': profileUrl
  };
}
