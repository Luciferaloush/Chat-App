import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/chat_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  static ContactCubit get(context) => BlocProvider.of(context);

  List<Chat> contacts = [
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
      status: "Full Stack Developer"
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer"
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer"
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer"
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer"
    ),
    Chat(
        name: "Ali Habib",
        icon: "assets/svg_icon/person_36dp_000000.svg",
        currentMessage: "",
        time: "",
        status: "Full Stack Developer"
    ),
  ];
}
