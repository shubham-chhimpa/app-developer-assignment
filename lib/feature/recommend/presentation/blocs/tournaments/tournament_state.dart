part of 'tournament_bloc.dart';

abstract class TournamentState extends Equatable {
  const TournamentState();
}

class TournamentInitial extends TournamentState {
  @override
  List<Object> get props => [];
}


class TournamentLoadingState extends TournamentState {
  @override
  List<Object> get props => [];
}

class TournamentLoadSuccessState extends TournamentState {
  final List<Tournament> tournaments;
  const TournamentLoadSuccessState({required this.tournaments});
  @override
  List<Object?> get props => [tournaments];
}

class TournamentLoadFailState extends TournamentState {
  @override
  List<Object> get props => [];
}