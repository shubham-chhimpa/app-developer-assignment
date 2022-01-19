import 'dart:async';

import 'package:appdevassignment/core/utils/usercases.dart';
import 'package:appdevassignment/feature/recommend/domain/entities/tournament.dart';
import 'package:appdevassignment/feature/recommend/domain/usecases/fetch_tournaments.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tournament_event.dart';
part 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  TournamentBloc({required this.fetchTournaments}) : super(TournamentInitial());
  final FetchTournaments fetchTournaments;
  @override
  Stream<TournamentState> mapEventToState(TournamentEvent event) async* {
    if (event is FetchTournamentsEvent) {
      yield TournamentLoadingState();
      final fetchTournamentsFailedOrSuccess = await fetchTournaments(NoParams());
      yield fetchTournamentsFailedOrSuccess.fold(
            (l) {
          return TournamentLoadFailState();
        },
            (r) {
          return TournamentLoadSuccessState(tournaments: r);
        },
      );
    }
  }
}
