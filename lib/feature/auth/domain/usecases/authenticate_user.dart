import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/core/utils/usercases.dart';
import 'package:appdevassignment/feature/auth/domain/entities/user.dart';
import 'package:appdevassignment/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthenticateUser implements UseCase<User, Param> {
  final AuthRepository authRepository;

  AuthenticateUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(Param param) async {
    return await authRepository.authenticateUser(param.mobileNumber,param.password);
  }
}

class Param extends Equatable{
  final String password;
  final String mobileNumber;

  const Param({required this.mobileNumber, required this.password});

  @override
  List<Object?> get props => [password, mobileNumber];
}