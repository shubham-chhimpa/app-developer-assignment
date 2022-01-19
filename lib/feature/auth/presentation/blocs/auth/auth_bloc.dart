import 'dart:async';

import 'package:appdevassignment/core/utils/usercases.dart';
import 'package:appdevassignment/feature/auth/domain/entities/user.dart';
import 'package:appdevassignment/feature/auth/domain/usecases/authenticate_user.dart';
import 'package:appdevassignment/feature/auth/domain/usecases/get_user.dart';
import 'package:appdevassignment/feature/auth/domain/usecases/logout_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {required this.getUser,
        required this.authenticateUser,
        required this.logoutUser})
      : super(AuthInitial());
  final GetUser getUser;
  final AuthenticateUser authenticateUser;
  final LogoutUser logoutUser;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoadUserEvent) {
      yield AuthLoadingState();
      final getAuthFailedOrSuccess = await getUser(NoParams());
      yield getAuthFailedOrSuccess.fold(
            (l) {
          return AuthLoadFailState();
        },
            (r) {
          return AuthLoadSuccessState(user: r);
        },
      );
    }

    if (event is AuthenticateUserEvent) {
      yield AuthLoadingState();
      final getUserFailedOrSuccess = await authenticateUser(
          Param(password: event.password, mobileNumber: event.mobileNumber));
      yield getUserFailedOrSuccess.fold(
            (l) {
          return const AuthenticateFailState(text: "Wrong Login/Password");
        },
            (r) {
          return AuthLoadSuccessState(user: r);
        },
      );
    }

    if (event is LogoutEvent) {
      yield AuthLoadingState();
      final getDataFailedOrSuccess = await logoutUser(NoParams());
      yield getDataFailedOrSuccess.fold(
            (l) {
          return const AuthenticateFailState(text: '');
        },
            (r) {
          return AuthLoadSuccessState(user: r);
        },
      );
    }
  }
}
