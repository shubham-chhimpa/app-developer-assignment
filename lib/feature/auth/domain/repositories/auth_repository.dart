import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/feature/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> logoutUser();
  Future<Either<Failure, User>> authenticateUser(String mobile,String password);
}