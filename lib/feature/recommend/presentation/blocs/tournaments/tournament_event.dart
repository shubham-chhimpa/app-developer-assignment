part of 'tournament_bloc.dart';

abstract class TournamentEvent extends Equatable {
  const TournamentEvent();
}

class FetchTournamentsEvent extends TournamentEvent {
  @override
  List<Object?> get props => [];
}
