import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../model/message.dart';

part 'individual_state.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit() : super(IndividualInitial());

  static IndividualCubit get(context) => BlocProvider.of(context);
  IO.Socket? socket;
  ImagePicker picker = ImagePicker();
  bool sendButton = false;
  XFile? file;
  final List<Message> messageList = [];
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  sendButtonMessage(String value) {
    if (value.isNotEmpty) {
      sendButton = true;
      emit(ShowSendButton());
    } else {
      sendButton = false;
      emit(HiddenSendButton());
    }
  }

  void connect(int id) {
    socket = IO.io("http://192.168.56.1:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket!.connect();
    socket!.emit("signin", id);
    socket!.onConnect((data) {
      print("Connected");
      socket!.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"], msg['path']);
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    print(socket!.connected);
  }

  void sendMessage(String message, int sourceId, int targetId, String path) {
    setMessage("source", message, path);
    socket!.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "path": path
    });
  }

  void setMessage(String type, String message, String path) {
    Message messages = Message(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16),
        path: path);
    messageList.add(messages);
    emit(SetMessage());
  }
}
