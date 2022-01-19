part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoadUserEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthenticateUserEvent extends AuthEvent {
  final String password;
  final String mobileNumber;

  const AuthenticateUserEvent({required this.mobileNumber, required this.password});

  @override
  List<Object?> get props => [password, mobileNumber];
}

class LogoutEvent extends AuthEvent{
  @override
  List<Object?> get props => [];

}