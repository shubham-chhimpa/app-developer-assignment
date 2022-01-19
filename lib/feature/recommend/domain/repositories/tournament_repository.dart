import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/feature/recommend/domain/entities/tournament.dart';
import 'package:dartz/dartz.dart';

abstract class TournamentRepository {
  Future<Either<Failure, List<Tournament>>> getTournaments();
}