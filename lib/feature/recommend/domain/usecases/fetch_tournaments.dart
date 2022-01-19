import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/core/utils/usercases.dart';
import 'package:appdevassignment/feature/recommend/domain/entities/tournament.dart';
import 'package:appdevassignment/feature/recommend/domain/repositories/tournament_repository.dart';
import 'package:dartz/dartz.dart';

class FetchTournaments implements UseCase<List<Tournament>, NoParams> {
  final TournamentRepository tournamentRepository;

  FetchTournaments(this.tournamentRepository);

  @override
  Future<Either<Failure, List<Tournament>>> call(NoParams params) async {
    return await tournamentRepository.getTournaments();
  }
}
