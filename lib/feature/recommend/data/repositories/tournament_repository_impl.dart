import 'package:appdevassignment/core/error/exceptions.dart';
import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/feature/recommend/data/datasources/tournament_local_datasource.dart';
import 'package:appdevassignment/feature/recommend/domain/entities/tournament.dart';
import 'package:appdevassignment/feature/recommend/domain/repositories/tournament_repository.dart';
import 'package:dartz/dartz.dart';

class TournamentRepositoryImpl implements TournamentRepository {
  final TournamentDataSource tournamentDataSource;

  TournamentRepositoryImpl({required this.tournamentDataSource});

  @override
  Future<Either<Failure, List<Tournament>>> getTournaments() async {
    try {
      List<Tournament>? tournaments =
      await tournamentDataSource.getTournaments();
      return Right(tournaments);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
