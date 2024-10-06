part of 'create_group_cubit.dart';

@immutable
abstract class CreateGroupState {}

class CreateGroupInitial extends CreateGroupState {}

class SelectContact extends CreateGroupState {}

class UnSelectContact extends CreateGroupState {}