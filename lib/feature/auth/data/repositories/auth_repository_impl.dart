import 'package:appdevassignment/core/error/exceptions.dart';
import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/feature/auth/data/datasources/auth_local_datasource.dart';
import 'package:appdevassignment/feature/auth/domain/entities/user.dart';
import 'package:appdevassignment/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      User? user = await authLocalDataSource.getUser();
      if (user == null) throw DataBaseException();
      return Right(user);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, User>> authenticateUser(String mobile, String password) async{
    try {
      User? user = await authLocalDataSource.authenticateUser(mobile, password);
      if (user == null) throw DataBaseException();
      return Right(user);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, User>> logoutUser() async {
    try {
      User? user = await authLocalDataSource.logoutUser();
      if (user == null) throw DataBaseException();
      return Right(user);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }


}
