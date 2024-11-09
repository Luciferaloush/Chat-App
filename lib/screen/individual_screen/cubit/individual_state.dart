part of 'individual_cubit.dart';

@immutable
abstract class IndividualState {}

class IndividualInitial extends IndividualState {}

class ShowSendButton extends IndividualState {}

class HiddenSendButton extends IndividualState {}

class MessageDone extends IndividualState {}

class SetMessage extends IndividualState {}

class SuccessSend extends IndividualState {}

class ErrorSend extends IndividualState {}

class SetPopTime extends IndividualState {}
class ChatLoading extends IndividualState {}

class ChatLoaded extends IndividualState {}

class ChatError extends IndividualState {}

