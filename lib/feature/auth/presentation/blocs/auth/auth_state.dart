part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadSuccessState extends AuthState {
  final User? user;
  const AuthLoadSuccessState({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthLoadFailState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticateFailState extends AuthState {
  final String text;
  const AuthenticateFailState({required this.text});
  @override
  List<Object> get props => [];
}
