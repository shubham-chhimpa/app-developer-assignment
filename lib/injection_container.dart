import 'package:appdevassignment/feature/auth/domain/repositories/auth_repository.dart';
import 'package:appdevassignment/feature/auth/data/datasources/auth_local_datasource.dart';
import 'package:appdevassignment/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:appdevassignment/feature/auth/domain/usecases/authenticate_user.dart';
import 'package:appdevassignment/feature/auth/domain/usecases/get_user.dart';
import 'package:appdevassignment/feature/recommend/data/datasources/tournament_local_datasource.dart';
import 'package:appdevassignment/feature/recommend/data/repositories/tournament_repository_impl.dart';
import 'package:appdevassignment/feature/recommend/domain/repositories/tournament_repository.dart';
import 'package:appdevassignment/feature/recommend/domain/usecases/fetch_tournaments.dart';
import 'package:appdevassignment/feature/recommend/presentation/blocs/tournaments/tournament_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/auth/domain/usecases/logout_user.dart';
import 'feature/auth/presentation/blocs/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory<AuthBloc>(
        () => AuthBloc(getUser: sl(),authenticateUser: sl(), logoutUser: sl()),
  );
  sl.registerFactory<TournamentBloc>(
        () => TournamentBloc(fetchTournaments: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => AuthenticateUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));
  sl.registerLazySingleton(() => FetchTournaments(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(authLocalDataSource: sl()));
  sl.registerLazySingleton<TournamentRepository>(
          () => TournamentRepositoryImpl(tournamentDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
          () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<TournamentDataSource>(
          () => TournamentLocalDataSource());
  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
