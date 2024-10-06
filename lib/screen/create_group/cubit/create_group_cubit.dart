import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupInitial());

  static CreateGroupCubit get(context) => BlocProvider.of(context);

  List<Chat> contacts = [
    Chat(
      name: "Ali Habib",
      icon: "assets/svg_icon/person_36dp_000000.svg",
      currentMessage: "",
      time: "",
      status: "Full Stack Developer",
      isSelect: false,
    ),
    Chat(
      name: "Ali Habib",
      icon: "assets/svg_icon/person_36dp_000000.svg",
      currentMessage: "",
      time: "",
      status: "Full Stack Developer",
      isSelect: false,
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer",
      isSelect: false,
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer",
      isSelect: false,
    ),
  ];
  List<Chat> groups = [];

  void setStateSelect(int index) {
    contacts[index].isSelect = !contacts[index].isSelect; // Toggle selection
    if (contacts[index].isSelect) {
      groups.add(contacts[index]);
    } else {
      groups.remove(contacts[index]);
    }
    emit(contacts[index].isSelect ? SelectContact() : UnSelectContact());
  }
}
