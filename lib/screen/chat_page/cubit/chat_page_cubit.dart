import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';
part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(ChatPageInitial());
  static ChatPageCubit get(context) => BlocProvider.of(context);

  List<Chat> chats = [
    Chat(
      name: "Ali Habib",
      icon: "assets/svg_icon/person_36dp_000000.svg",
      currentMessage: "Hi everyone",
      isGroup: false,
      time: "4:00",
      status: ""
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "Hi everyone",
        isGroup: false,
        time: "4:00",
      status: ""
    )
  ];
}
