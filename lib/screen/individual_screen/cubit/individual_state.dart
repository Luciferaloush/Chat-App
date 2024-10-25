part of 'individual_cubit.dart';

@immutable
abstract class IndividualState {}

class IndividualInitial extends IndividualState {}

class ShowSendButton extends IndividualState {}

class HiddenSendButton extends IndividualState {}

class MessageDone extends IndividualState {}

class SetMessage extends IndividualState {}
