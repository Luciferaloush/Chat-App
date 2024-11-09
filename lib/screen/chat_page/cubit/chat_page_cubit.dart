import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../helper/cache_helper.dart';
import '../../../model/chat_model.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../model/message.dart';
import '../../../utils/constant.dart';

part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(ChatPageInitial());

  static ChatPageCubit get(context) => BlocProvider.of(context);
  List<Messages> allChat = [];
  IO.Socket? socket;

  Future<void> initializeChat(String userId) async {
    await getAllChat(userId: userId);
    connectSocket(userId);
  }

  void connectSocket(String userId) {
    socket = IO.io("http://192.168.56.1:5000/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket!.connect();

    socket!.onConnect((_) {
      print("Socket connected");
      socket!.emit("signin", userId); // Send user ID to the server
    });

    socket!.on("newMessage", (msg) {
      print("New message received: $msg");
      // Assuming msg contains the necessary data to create a new message
      Messages newMessage = Messages.fromJson(msg);
      allChat.add(newMessage); // Add the new message to the chat list
      emit(ChatLoaded()); // Emit state change to refresh UI
    });
  }

  Future<void> getAllChat({required String userId}) async {
    try {
      emit(ChatLoading());
      final response = await http.get(
        Uri.parse("${Constants().baseUrl}${Constants().chat}/$userId"),
        headers: {
          "Content-Type": "application/json",
          "token": CacheHelper.getData(key: "token"),
        },
      );

      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        // Check if the response is a List or a Map
        if (decodedResponse is List) {
          // Handle list of messages
          allChat = decodedResponse.map((chat) {
            if (chat is Map<String, dynamic>) {
              return Messages.fromJson(chat);
            } else {
              throw Exception('The data is not in the correct format');
            }
          }).toList();
        } else if (decodedResponse is Map<String, dynamic>) {
          // Handle a single message object
          Messages singleMessage = Messages.fromJson(decodedResponse);
          allChat = [singleMessage]; // Wrap single message in a list
        } else {
          emit(ChatError(message: 'The received data is not a valid format.'));
          return;
        }

        emit(ChatLoaded());
      } else {
        emit(ChatError(message: 'Failed to connect to the server: ${response
            .statusCode}'));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      emit(ChatError(message: 'An error occurred: $e'));
    }
  }
}