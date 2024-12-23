part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {}

class UsersError extends UsersState {
  final String error;
  UsersError({required this.error});
}