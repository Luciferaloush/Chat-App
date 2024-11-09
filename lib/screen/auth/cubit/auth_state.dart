part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final User user; // إضافة خاصية user

  RegisterSuccess({required this.user});
}

class RegisterError extends AuthState {
  final String error;

  RegisterError({required this.error});
}
