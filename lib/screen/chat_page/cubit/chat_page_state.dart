part of 'chat_page_cubit.dart';

@immutable
abstract class ChatPageState {}

class ChatPageInitial extends ChatPageState {}

class ChatLoading extends ChatPageState {}

class ChatLoaded extends ChatPageState {}

class ChatError extends ChatPageState {
  final String message;
  ChatError({required this.message});
}
