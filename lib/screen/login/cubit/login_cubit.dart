import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Chat? sourceChat;

  List<Chat> chats = [
    Chat(
      name: "ALi",
       isGroup: false,
      currentMessage: "hi",
      time: "3:00",
      icon: "assets/svg_icon/person_36dp_000000.svg",
      status: "last seen 2:00",
      id: 1,
    ),
    Chat(
        name: "maher",
        isGroup: false,
        currentMessage: "hi",
        time: "3:00",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        status: "last seen 2:00",
      id: 2,
    ),
    Chat(
        name: "mohamad",
        isGroup: false,
        currentMessage: "hi",
        time: "3:00",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        status: "last seen 2:00",
      id: 3
    ),
    Chat(
        name: "hassan",
        isGroup: false,
        currentMessage: "hi",
        time: "3:00",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        status: "last seen 2:00",
      id: 4

    ),
  ];
}
