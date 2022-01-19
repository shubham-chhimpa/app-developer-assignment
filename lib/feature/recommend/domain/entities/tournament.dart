import 'package:equatable/equatable.dart';

class Tournament extends Equatable {
  final String name;
  final String coverUrl;
  final String gameName;

  const Tournament(
      {required this.name, required this.gameName, required this.coverUrl});

  @override
  List<Object?> get props => [name, gameName, coverUrl];

  Tournament.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        gameName = json['game_name'],
        coverUrl = json['cover_url'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'game_name': gameName,
    'cover_url': coverUrl,
  };
}
