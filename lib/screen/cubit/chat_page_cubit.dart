import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(ChatPageInitial());
}
