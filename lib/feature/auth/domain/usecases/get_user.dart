import 'package:appdevassignment/core/error/failures.dart';
import 'package:appdevassignment/core/utils/usercases.dart';
import 'package:appdevassignment/feature/auth/domain/entities/user.dart';
import 'package:appdevassignment/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  GetUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.getUser();
  }
}
